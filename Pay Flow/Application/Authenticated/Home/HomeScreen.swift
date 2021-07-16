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
    @EnvironmentObject var authenticatedRouter: ViewRouter<AuthenticatedCoordinator.Route>
    @EnvironmentObject var manager: AuthenticationManager
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject private var presenter: Presenter
    
    let boundsListOffset = CGFloat(105)
    let boundsRegisterOffset = CGFloat(20)
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { bounds in
                ZStack(alignment: .top) {
                    GradientRetangle(height: CGFloat(60), startRadius: CGFloat(20))
                    
                    HomeHeader(name: manager.user.profile.name, image: manager.user.profile.imageURL(withDimension: 48).absoluteString)
                    
                    RegisteredCard()
                        .offset(y: boundsRegisterOffset)
                    
                    ListOfTickets()
                        .offset(y: boundsListOffset)
                        .frame(height: abs(bounds.size.height - 160))
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
