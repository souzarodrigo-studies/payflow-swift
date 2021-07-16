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
    
    let boundsListOffset = CGFloat(120)
    let boundsRegisterOffset = CGFloat(20)
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { bounds in
                ZStack(alignment: .top) {
                    GradientRetangle(height: CGFloat(60), factorOfStatedRadius: CGFloat(1))
                    
                    HomeHeader(name: manager.user.profile.name, image: manager.user.profile.imageURL(withDimension: 48).absoluteString)
                    
                    RegisteredCard()
                        .offset(y: boundsRegisterOffset)
                    
                    ListOfTickets()
                        .frame(height: bounds.size.height - 140)
                        .offset(y: boundsListOffset)
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .navigationBarHidden(true)
            }
        }
        .background(Color(.clear))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
