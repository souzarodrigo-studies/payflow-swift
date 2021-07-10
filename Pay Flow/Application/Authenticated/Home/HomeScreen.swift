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
                GradientRetangle(height: CGFloat(80))
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Ola, ")
                            .font(.title)
                            .foregroundColor(.white)
                            +
                            Text("\(manager.user.profile.name)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Mantenha suas contas em dias")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .offset(y: -55)
                .padding(.leading, 24)
                .padding(.trailing, 24)
                
                ZStack {
                    Rectangle()
                        .fill(Color("HomeCardBackground"))
                        .frame(width: 340, height: 80)
                        .cornerRadius(8)
                }
                .offset(y: 40)
                
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
