//
//  ContentView.swift
//  APIRequestExample
//
//  Created by Federico on 19/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel(testMode: true)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.quotes) { quote in
                    ItemView(quote: quote)
                        .padding(4)
                }
            }
            .refreshable {
                vm.makeApiRequest()
            }
            .navigationTitle("Anime Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
