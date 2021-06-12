//
//  HomeView.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 11/06/21.
//

import SwiftUI

struct HomeView: View {
    
   @Binding var teams: [ClubModel]
    
    var body: some View {
        VStack(spacing: 15){
            
            HStack{
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Clubs").font(.largeTitle)
                    Button(action: {
                        
                    }){
                        Text("Premiere League")
                    }.foregroundColor(.black)
                }
                
                Spacer()
                Button(action:{
                    
                }){
                    Image("menu")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            
            SearchView().padding(.vertical, 15)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    ForEach(teams, id: \.idTeam){ team in
                        CardView(teamName: team.strTeam, teamSlogan: team.strKeywords, imageURL: team.strTeamBadge)
                    }
                }.padding()
            }
        }.padding()
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(teams: $teams)
//    }
//}

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
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                Text("a.k.a Nickname : \(teamSlogan)")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            Spacer()
        }
        .frame(width: 320, height: 80)
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 8, x: 0, y: 0)
    }
}

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass").font(.body)
            TextField("Search club", text: $searchText)
        }
        .padding()
        .foregroundColor(.black)
        .background(Color("LightGray"))
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
