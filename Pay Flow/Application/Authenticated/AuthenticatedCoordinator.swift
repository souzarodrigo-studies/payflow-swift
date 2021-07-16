//
//  AuthenticatedCoordinator.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI
import Stinsen

final class AuthenticatedCoordinator: ViewCoordinatable {
    var children = ViewChild()

    enum Route: ViewRoute {
//        case unauthenticated
//        case authenticated
//        case loading
    }
    
    func resolveRoute(route: Route) -> AnyCoordinatable {
//        switch route {
//        case .unauthenticated:
//            return AnyCoordinatable(
//                NavigationViewCoordinatable(
//                     UnauthenticatedCoordinator()
//                )
//            )
//        case .authenticated:
//            return AnyCoordinatable(
//                NavigationViewCoordinatable(
//                     AuthenticatedCoordinator()
//                )
//            )
//        case .loading:
//            return AnyCoordinatable(
//                NavigationViewCoordinatable(
//                    LoadingCoordinator()
//                )
//            )
//        }
    }
    
    @discardableResult
    func start() -> some View {
        let view = ToolBarFactory.make()
        return view
    }
    
    init() {

    }
}
