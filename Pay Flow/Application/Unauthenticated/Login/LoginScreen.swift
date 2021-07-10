//
//  LoginScreen.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI
import Stinsen

struct LoginScreen<Presenter: LoginPresenting>: View {
    
    @EnvironmentObject var mainRouter: ViewRouter<MainCoordinator.Route>
    @EnvironmentObject var unauthenticatedRouter: NavigationRouter<UnauthenticatedCoordinator.Route>
    @EnvironmentObject var manager: AuthenticationManager
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject private var presenter: Presenter
    
    @State private var showCertificates: Bool = false
    @State private var contentOffset = CGFloat(0)
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                GradientRetangle(height: CGFloat(160))
                
                VStack {
                    Image(colorScheme == .dark ? "Login Image Dark" : "Login Image")
                    
                    Image("BarCode")
                        .padding()
                    
                    Text("Organize seus boletos em um só lugar")
                        .font(.system(size: 32, weight: .semibold))
                        .padding(.horizontal, 70)
                        .multilineTextAlignment(.center)
                    
                    Button(action: manager.signIn) {
                        HStack {
                            Image("google-icon")
                                .frame(alignment: .center)
                                .frame(width: 50, height: 50)
                            
                            Divider()
                                .background(Color.gray)
                            
                            Spacer()
                            
                            VStack {
                                Text("Entrar com Google")
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                            }
                            .frame(alignment: .center)
                            .frame(width: 250, height: 50)
                        }
                        .frame(width: 300, height: 30)
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(lineWidth: 1.0)
                                .fill(Color.gray)
                        )
                    }
                    .padding()
                }
                .offset(y: -75)
                
                VStack(alignment: .center) {
                    Text("Loading...")
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .padding(10)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(manager.isLoading ? 1 : 0)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        @StateObject var manager = AuthenticationManager()
        return LoginFactory
            .make(with: LoginViewModel())
            .environmentObject(manager)
    }
}


