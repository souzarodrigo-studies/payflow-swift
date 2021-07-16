//
//  HeaderOfTickets.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 16/07/21.
//

import SwiftUI

struct HeaderOfTickets: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Meus boletos")
                    .font(.title3)
                
                Spacer()
                
                Text("13")
                    .fontWeight(.bold)
                    .font(.subheadline)
                +
                Text(" ao total")
                    .font(.subheadline)
            }
            Divider()
        }
    }
}

struct HeaderOfTickets_Previews: PreviewProvider {
    static var previews: some View {
        HeaderOfTickets()
    }
}
