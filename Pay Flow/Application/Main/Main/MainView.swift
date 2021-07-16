//
//  LoadingView.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI
import Stinsen

struct MainView: View {
    @EnvironmentObject var router: ViewRouter<MainCoordinator.Route>
    @EnvironmentObject var manager: AuthenticationManager
    
    var body: some View {
        VStack{}
        .onAppear(perform: {
            switch (manager.state) {
            case .signedIn:
                DispatchQueue.main.async {
                    router.route(to: .authenticated)
                }
            case .signedOut:
                DispatchQueue.main.async {
                    router.route(to: .unauthenticated)
                }
            case .loading:
                DispatchQueue.main.async {
                    router.route(to: .loading)
                }
            }
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
