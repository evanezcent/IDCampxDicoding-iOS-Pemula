//
//  ProfileView.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 30/06/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Spacer()
            
            Image("anime-wolf")
                .resizable()
                .frame(width:200, height:200)
                .clipShape(Circle())
                .shadow(radius: 10)
            
            Text("Pratama Yoga")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Software Engineer")
                .foregroundColor(Color("Primary"))
                .italic()
                .padding(.bottom, 10)
            
            Text("Seorang entry level Software Engineer yang suka melakukan yang menurutnya hal-hal keren. So far lagi tertarik sama React JS, Flutter, dan Swift. Lebih prefer minum susu daripada kopi.")
                .foregroundColor(.white)
                .padding(.bottom, 50)
            
            Text("Lets connect !")
                .foregroundColor(.white)
                .fontWeight(.medium)
                .font(.title2)
                .padding(.bottom, 6)
            
            HStack{
                UrlButton(
                    uri: "https://github.com/evanezcent",
                    name: "Github",
                    bgColor:.white,
                    textColor:Color("Dark"))
                
                UrlButton(
                    uri:"https://www.linkedin.com/in/pratamays/",
                    name: "Linkedin",
                    bgColor:Color("Blue"),
                    textColor:.white)
                
                UrlButton(
                    uri: "https://pratamays.medium.com/",
                    name: "Medium",
                    bgColor:Color.black,
                    textColor:.white)
            }
            
            Spacer()
        }
        .padding()
        .accentColor(Color("Primary"))
        .navigationBarColor(UIColor(Color("Dark")))
        .background(Color("Dark"))
            .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct UrlButton: View {
    @State var uri: String
    @State var name: String
    @State var bgColor: Color
    @State var textColor: Color
    
    var body: some View {
        Button(action: {
            if let url = URL(string: uri) {
                UIApplication.shared.open(url)
            }
        }) {
            Text(name)
                .frame(height:10)
                .padding()
                .foregroundColor(textColor)
                .background(bgColor)
                .cornerRadius(10)
        }
        
    }
}
