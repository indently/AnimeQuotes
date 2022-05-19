//
//  ViewModel.swift
//  APIRequestExample
//
//  Created by Federico on 19/05/2022.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var quotes = [Quote]()
    
    private let baseUrl = "https://animechan.vercel.app/api/quotes"
    private let apiManager = ApiManager()
    
    init(testMode: Bool) {
        testMode ? makeFakeApiRequest() : makeApiRequest()
    }
    
    func makeApiRequest() {
        apiManager.getData(url: baseUrl, model: [Quote].self) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch(result) {
                case .success(let quotes):
                    self.quotes = quotes
                    
                case .failure(let error):
                    let errorQuote = Quote(anime: "Error", character: "Error", quote: error.localizedDescription)
                    self.quotes = [errorQuote]
                    print(error)
                }
            }
        }
    }
    
    // Used for testing
    func makeFakeApiRequest() {
        self.quotes = Bundle.main.decode(file: "quotes.json")
    }
}
