//
//  ListOfTickets.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 15/07/21.
//

import SwiftUI

struct ListOfTickets: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...100, id: \.self) { value in
                    Text("Row \(value)")
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
