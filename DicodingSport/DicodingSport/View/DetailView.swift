//
//  DetailView.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 14/06/21.
//

import SwiftUI

struct DetailView: View {
    
    @State var team: ClubModel
    @State var viewState = CGSize.zero
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            VStack(alignment: .leading){
                GeometryReader { geometry in
                    ImageCarousel(numberOfImages: 3) {
                        CarouselImage(imgURL: team.strTeamBadge, w: geometry.size.width-20, h: geometry.size.height)
                        CarouselImage(imgURL: team.strStadiumThumb, w: geometry.size.width-20, h: geometry.size.height)
                        CarouselImage(imgURL: team.strTeamJersey, w: geometry.size.width-20, h: geometry.size.height)
                    }
                }.frame(height: 350, alignment: .center)
                
                VStack (alignment: .leading){
                    Text(team.strTeam)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .padding(.top, 20)
                    Text("a.k.a \(team.strKeywords)")
                        .font(.system(size: 14))
                        .italic()
                        .foregroundColor(.white)
                        .padding(.bottom, 12)
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                        .padding(.bottom, 6)
                    Text(team.strDescriptionEN)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 10)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        })
        .navigationBarColor(UIColor(Color("Dark")))
        .navigationBarTitle(Text(team.strTeam), displayMode: .inline)
        .background(Color("Dark"))
        .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
    }
}

struct Curves: Shape {
    var corner : UIRectCorner
    var radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corner,
                                cornerRadii: CGSize(width:radius, height: radius))
        return Path(path.cgPath)
    }
    
}

struct CarouselImage: View {
    @State var imgURL : String
    @State var w : CGFloat
    @State var h : CGFloat
    
    var body: some View {
        Image(systemName: "aqi.high")
            .loadImage(url: URL(string: imgURL)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: w, height: h)
            .clipped()
            .background(Color("Dark"))
            .clipShape(Curves(corner: .allCorners, radius: 20)).shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
            .padding(.horizontal, 6)
    }
}
