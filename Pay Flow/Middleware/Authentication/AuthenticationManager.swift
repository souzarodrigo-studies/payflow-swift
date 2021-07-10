//
//  AuthenticationManager.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import Firebase
import GoogleSignIn

class AuthenticationManager: NSObject, ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    @Published var user: GIDGoogleUser!
    
    override init() {
        super.init()
        
        setupGoogleSignIn()
    }
    
    func signIn() {
        if GIDSignIn.sharedInstance().currentUser == nil {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        
        do {
            try Auth.auth().signOut()
            
            state = .signedOut
        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
    }
    
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
    }
}

extension AuthenticationManager: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            firebaseAuthentication(withUser: user)
        } else {
            print(error.debugDescription)
        }
    }
    
    private func firebaseAuthentication(withUser user: GIDGoogleUser) {
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (_, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.state = .signedIn
                    self.user = GIDSignIn.sharedInstance().currentUser
                }
            }
        }
    }
}
