//
//  MainCoordinator.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI
import Stinsen

class MainCoordinator: ViewCoordinatable {
    
    var children = ViewChild()
    
    enum Route: ViewRoute {
        case unauthenticated
        case authenticated
    }
    
    func resolveRoute(route: Route) -> AnyCoordinatable {
        switch route {
        case .unauthenticated:
            return AnyCoordinatable(
                NavigationViewCoordinatable(
                     UnauthenticatedCoordinator()
                )
            )
        case .authenticated:
            return AnyCoordinatable(
                NavigationViewCoordinatable(
                     AuthenticatedCoordinator()
                )
            )
        }
    }
    
    @discardableResult
    func start() -> some View {
        return LoadingView()
    }

}
