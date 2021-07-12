//
//  HomeScreen.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI
import Stinsen

struct HomeScreen<Presenter: HomePresenting>: View {
    @EnvironmentObject var mainRouter: ViewRouter<MainCoordinator.Route>
    @EnvironmentObject var authenticatedRouter: NavigationRouter<AuthenticatedCoordinator.Route>
    @EnvironmentObject var manager: AuthenticationManager
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject private var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                GradientRetangle(height: CGFloat(60), factorOfStatedRadius: CGFloat(0.7))
                
                HomeHeader(name: manager.user.profile.name, image: manager.user.profile.imageURL(withDimension: 48).absoluteString)

                RegisteredCard()
                .offset(y: 25)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
