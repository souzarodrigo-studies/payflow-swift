//
//  ContentView.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI
import Stinsen

struct ContentView: View {
    @StateObject var manager = AuthenticationManager()
    
    var body: some View {
        CoordinatorView(
            MainCoordinator()
        )
        .environmentObject(manager)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
