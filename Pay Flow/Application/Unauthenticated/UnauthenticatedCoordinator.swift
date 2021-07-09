//
//  UnauthenticatedCoordinator.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI
import Stinsen

class UnauthenticatedCoordinator: NavigationCoordinatable {
    var navigationStack = NavigationStack()
    
    enum Route: NavigationRoute {
//        case forgotPassword
    }

    func resolveRoute(route: Route) -> Transition {
//        switch route {
//        case .forgotPassword:
//            return .push(AnyView(ForgotPasswordScreen()))
//        }
    }
    
    @discardableResult
    func start() -> some View {
        let view = LoginFactory.make(with: LoginViewModel())
        return view
    }
    
    init() {

    }
}
