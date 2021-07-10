//
//  AuthenticatedCoordinator.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI
import Stinsen

class AuthenticatedCoordinator: NavigationCoordinatable {
    var navigationStack: NavigationStack = NavigationStack()

    enum Route: NavigationRoute {

    }
    
    func resolveRoute(route: Route) -> Transition {

    }
    
    @discardableResult
    func start() -> some View {
        let view = HomeFactory.make(with: HomeViewModel())
        return view
    }
}

