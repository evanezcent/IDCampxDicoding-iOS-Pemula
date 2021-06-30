//
//  HomeView.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 11/06/21.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var teams: [ClubModel]
    @State var searchText = ""
    
    @State var splash:Bool = true
    
    var body: some View {
        
        let binding = Binding<String>(get: {
            self.searchText
        }, set: {
            self.searchText = $0
        })

        NavigationView {

            VStack(spacing: 15){
                
                if(splash){
                    Text("DICODING")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(splash ? 1 : 0)

                }else{
                    HStack{
                        VStack(alignment: .leading, spacing: 15){
                            Text("Premiere")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary")
                                )
                            Text("League Clubs")
                                .foregroundColor(Color("Primary"))
                        }

                        Spacer()
                    }

                    SearchView(search: binding)
                        .padding(.top, 15)

                    if teams.isEmpty {
                        VStack {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color("Primary")))
                        }
                        Spacer()
                    }
                    else {
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 15){
                                ForEach(teams, id: \.idTeam){ team in
                                    if (searchText == ""){
                                        NavigationLink(
                                            destination: DetailView(team: team)){
                                            CardView(teamName: team.strTeam, teamSlogan: team.strKeywords, imageURL: team.strTeamBadge)
                                        }
                                    }else if(team.strTeam.lowercased().contains(searchText.lowercased())){
                                        NavigationLink(
                                            destination: DetailView(team: team)){
                                            CardView(teamName: team.strTeam, teamSlogan: team.strKeywords, imageURL: team.strTeamBadge)
                                        }
                                    }
                                }
                            }.padding()
                        }

                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        splash = false
                    }
                }
            }
            .padding()
            .accentColor(Color("Primary"))
            .navigationBarHidden(true)
            .navigationBarColor(UIColor(Color("Dark")))
            .background(Color("Dark"))
                .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
        }
    }
}

struct CardView: View {
    @State var teamName: String
    @State var teamSlogan: String
    @State var imageURL: String
    
    var body: some View {
        HStack(alignment:.top, spacing: 10){
            Image(systemName: "aqi.high")
                .loadImage(url: URL(string: imageURL)!)
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.top, 6)
            
            VStack(alignment: .leading, spacing: 5){
                Text("\(teamName)")
                    .foregroundColor(Color("Primary"))
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text("a.k.a Nickname : \(teamSlogan)")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
            Spacer()
        }
        .frame(width: 320, height: 80)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color("Dark"))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
    }
}

struct SearchView: View {
    @Binding<String> var search: String
    
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("Dark"))
                .font(.body)
            TextField("Search club", text: $search)
                .foregroundColor(Color("Dark"))
        }
        .padding()
        .foregroundColor(.black)
        .background(Color("LightGray"))
        .cornerRadius(5)
    }
}

extension Image {
    func loadImage(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
//
