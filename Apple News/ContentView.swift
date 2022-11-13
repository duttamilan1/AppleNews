//
//  ContentView.swift
//  Apple News
//
//  Created by Milan Dutta on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NewsTabView()
            .tabItem {
                Label("News", systemImage: "newspaper")
            }
   
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
