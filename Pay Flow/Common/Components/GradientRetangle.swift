//
//  GradientRetangle.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI

struct GradientRetangle: View {
    let height: CGFloat
    let factorOfStatedRadius: CGFloat
    
    let gradient = Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.768627451, blue: 0.5019607843, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5803921569, blue: 0.1019607843, alpha: 1))])
    
    var body: some View {
        Rectangle()
            .fill(
                RadialGradient(gradient: gradient, center: .bottom, startRadius: (height / 3), endRadius: height)
            )
            .edgesIgnoringSafeArea(.all)
            .frame(height: height)
    }
}


struct GradientRetangle_Previews: PreviewProvider {
    static var previews: some View {
        GradientRetangle(height: CGFloat(200), factorOfStatedRadius: CGFloat(0.5))
    }
}
