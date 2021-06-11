//
//  HomeView.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 11/06/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var numbers = [1,2,3,4,5,6,7,8,9]
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ScrollView {
                    LazyVStack {
                        ForEach(self.numbers, id: \.self) {item in
                            CardView() 
                                .padding(.bottom,5)
                                .padding(.top,5)
                        }
                    }.padding(.top)
                }
            }
            .navigationBarTitle("Premiere League")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CardView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            Image(systemName: "aqi.high")
            VStack(alignment: .leading, spacing: 5){
                Text("Club Name")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                Text("Short Description of the club xxxx xxxxxx xxx xxx xxx xxx xxx xxxx x")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        .frame(width: 360, height: 80)
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 8, x: 0, y: 0)
    }
}
