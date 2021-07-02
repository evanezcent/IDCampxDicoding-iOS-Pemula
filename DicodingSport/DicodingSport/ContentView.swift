//
//  ContentView.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 11/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var teams: [ClubModel] = []
    
    var body: some View {
        HomeView(teams: $teams)
            .onAppear(){
                ClubProvider().getAllData{ (payload) in
                    self.teams = payload
                }
                
            }
        
    }
    private func binding(for teams: [ClubModel]) -> Binding<[ClubModel]> {
        return $teams
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
