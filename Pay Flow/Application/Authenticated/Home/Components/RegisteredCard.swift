//
//  RegisteredCard.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 11/07/21.
//

import SwiftUI

struct RegisteredCard: View {
    
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("HomeCardBackground"))
                .frame(height: 80)
                .cornerRadius(8)
            HStack {
                Spacer()
                Image("BarCode2")
                Spacer()
                
                Divider()
                    .background(Color.gray)
                    .frame(height: 32)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Voce tem ")
                        .font(.callout)
                        .foregroundColor(.white)
                        +
                        Text("14 boletos")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("cadastrados para pagar")
                        .font(.callout)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .frame(height: 80)
        }
        .padding(.horizontal, 24)
    }
}

struct RegisteredCard_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredCard()
    }
}
