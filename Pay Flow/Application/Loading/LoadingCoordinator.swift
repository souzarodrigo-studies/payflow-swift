//
//  LoadingCoordinator.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 13/07/21.
//

import SwiftUI
import Stinsen

final class LoadingCoordinator: NavigationCoordinatable {
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
        return LoadingScreen()
    }
    
    init() {

    }
}

