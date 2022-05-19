//
//  ItemView.swift
//  APIRequestExample
//
//  Created by Federico on 19/05/2022.
//

import SwiftUI

struct ItemView: View {
    let quote: Quote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(quote.anime)
                    .font(.headline)
                Spacer()
            }
            Divider()
            Text("\(quote.quote)")
                .font(.body)
            
            HStack {
                Spacer()
                Text("- \(quote.character)")
                    .font(.footnote)
            }
        }
        .padding()
        .cornerRadius(14)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(quote: Quote.SampleQuote)
    }
}
