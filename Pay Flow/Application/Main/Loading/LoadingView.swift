//
//  LoadingView.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI
import Stinsen

struct LoadingView: View {
    @EnvironmentObject var router: ViewRouter<MainCoordinator.Route>
    @EnvironmentObject var manager: AuthenticationManager
    
    var body: some View {
        VStack {
            Text("Loading ...")
        }
        .onAppear(perform: {
            switch (manager.state) {
            case .signedIn:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    router.route(to: .authenticated)
                }
            case .signedOut:
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    router.route(to: .unauthenticated)
                }
            }
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
