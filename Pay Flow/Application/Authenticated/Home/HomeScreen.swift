//
//  HomeScreen.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var manager: AuthenticationManager
    
    var body: some View {
        VStack {
            Text(manager.user?.profile.email ?? "Not user")
        }
        .navigationBarHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
