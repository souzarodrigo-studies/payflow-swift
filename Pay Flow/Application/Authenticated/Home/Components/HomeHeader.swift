//
//  HomeHeader.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 11/07/21.
//

import SwiftUI

struct HomeHeader: View {
    var name: String
    var image: String
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Ola, ")
                    .font(.title2)
                    .foregroundColor(.white)
                    +
                    Text("\(name)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Text("Mantenha suas contas em dias")
                    .font(.callout)
                    .foregroundColor(.white)
            }
            Spacer()
            
            AsyncImage(
                url: URL(string: image)!,
                placeholder: { Text("Loading ...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 48, height: 48)
            .cornerRadius(5.0)
        }
        .offset(y: -55)
        .padding(.horizontal, 24)
        
    }
}

struct HomeHeader_Previews: PreviewProvider {
    @State static var value = "Rodrigo"
    
    static var previews: some View {
        Group {
            HomeHeader(name: "Rodrigo", image: "https://avatars.githubusercontent.com/u/31740435?v=4")
                .preferredColorScheme(.dark)
        }
    }
}
