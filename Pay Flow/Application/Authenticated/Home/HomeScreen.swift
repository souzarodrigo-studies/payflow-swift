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
                GradientRetangle(height: CGFloat(160))
                
                VStack {
                    Rectangle()
                        .fill(Color("HomeCardBackground"))
                        .frame(width: 327, height: 80)
                        .cornerRadius(5)
                }
                .padding(.top, 120)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var manager = AuthenticationManager()
        return HomeFactory.make(with: HomeViewModel())
            .environmentObject(manager)
    }
}
