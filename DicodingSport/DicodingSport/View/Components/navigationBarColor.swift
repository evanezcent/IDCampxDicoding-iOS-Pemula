//
//  navigationBarColor.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 30/06/21.
//

import Foundation
import SwiftUI

extension View {
    
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    
}
