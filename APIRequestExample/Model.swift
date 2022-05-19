//
//  Model.swift
//  APIRequestExample
//
//  Created by Federico on 19/05/2022.
//

import Foundation

struct Quote: Decodable, Identifiable {
    var id = UUID()
    let anime: String
    let character: String
    let quote: String
    
    private enum CodingKeys: String, CodingKey {
        case anime, character, quote
    }
    
    static var SampleQuotes: [Quote] = Bundle.main.decode(file: "quotes.json")
    static var SampleQuote = SampleQuotes.first!
}


