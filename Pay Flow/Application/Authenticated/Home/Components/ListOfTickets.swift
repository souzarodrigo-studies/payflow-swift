//
//  ListOfTickets.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 15/07/21.
//

import SwiftUI

struct ListOfTickets: View {
    var body: some View {
        VStack {
            HeaderOfTickets()
            .padding(.top, 22)
            .padding(.horizontal, 24)
            
            ScrollView {
                LazyVStack(alignment: .center) {
                    ForEach(1...100, id: \.self) { value in
                        ItemOfTickets()
                            .padding(.top, 22)
                            .padding(.horizontal, 24)
                    }
                }
            }
        }
    }
}

struct ListOfTickets_Previews: PreviewProvider {
    static var previews: some View {
        ListOfTickets()
    }
}

