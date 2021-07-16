//
//  ItemOfTickets.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 16/07/21.
//

import SwiftUI

struct ItemOfTickets: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text("Tia maria")
                    .font(.title2)
                
                Text("Vence em ")
                    .font(.headline)
                    .fontWeight(.regular)
                    +
                Text("16/03/21")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Text("R$ ")
                .font(.title3)
                .fontWeight(.regular)
                +
            Text("2.131,33")
                .font(.title3)
                .fontWeight(.semibold)
                .bold()
        }
    }
}

struct ItemOfTickets_Previews: PreviewProvider {
    static var previews: some View {
        ItemOfTickets()
    }
}
