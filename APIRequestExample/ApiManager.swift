//
//  ApiManager.swift
//  APIRequestExample
//
//  Created by Federico on 19/05/2022.
//

import Foundation

final class ApiManager {
    enum ApiError: Error {
        case invalidURL
    }

    func getData<T: Decodable>(url: String, model: T.Type, completion:@escaping(Result<T, Error>) -> ()) {
        guard let url = URL(string: url) else {
            completion(.failure(ApiError.invalidURL))
            return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error { completion(.failure(error)) }
                return }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(serverData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

extension Bundle {
    //MARK: - Used to decode local JSON files
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
