//
//  ImageCarousel.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 27/06/21.
//

import SwiftUI
import Combine

struct ImageCarousel<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content
    
    @State private var currentIndex: Int = 0
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -(geometry.size.width-10), y: 0)
            .animation(.spring())
            .onReceive(self.timer) { _ in
                
                self.currentIndex = (self.currentIndex + 1) % 3
            }
        }
    }
}

