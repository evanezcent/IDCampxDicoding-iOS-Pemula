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
                                        Image(systemName: "aqi.high")
                                            .loadImage(url: URL(string: team.strTeamBadge)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geometry.size.width-20, height: geometry.size.height)
                                            .clipped()
                                            .background(Color("Dark"))
                                            .clipShape(Curves(corner: .allCorners, radius: 20)).shadow(color: Color.black.opacity(0.2), radius: 5, x: 20, y: 20)
                                            .padding(.horizontal, 6)
                                        Image(systemName: "aqi.high")
                                            .loadImage(url: URL(string: team.strStadiumThumb)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geometry.size.width-20, height: geometry.size.height)
                                            .clipped()
                                            .background(Color("Dark"))
                                            .clipShape(Curves(corner: .allCorners, radius: 20)).shadow(color: Color.black.opacity(0.2), radius: 5, x: 20, y: 20)
                                            .padding(.horizontal, 6)
                                        Image(systemName: "aqi.high")
                                            .loadImage(url: URL(string: team.strTeamJersey)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geometry.size.width-20, height: geometry.size.height)
                                            .clipped()
                                            .background(Color("Dark"))
                                            .clipShape(Curves(corner: .allCorners, radius: 20)).shadow(color: Color.black.opacity(0.2), radius: 5, x: 20, y: 20)
                                            .padding(.horizontal, 6)
                                    }
                                }.frame(height: 350, alignment: .center)

                    Text(team.strTeam)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("a.k.a \(team.strKeywords)")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            })
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
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
