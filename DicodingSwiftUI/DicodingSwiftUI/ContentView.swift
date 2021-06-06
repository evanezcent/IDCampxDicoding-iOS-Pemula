//
//  ContentView.swift
//  DicodingSwiftUI
//
//  Created by Pratama Yoga on 06/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Dicoding Indonesia")
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
