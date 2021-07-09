//
//  LoginPresenter.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI

protocol LoginPresenting: ObservableObject {
    var viewModel: LoginViewModel { get }
}

final class LoginPresenter: LoginPresenting {
    
    @Published private(set) var viewModel: LoginViewModel {
        didSet { }
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        bindViewModel()
    }
    
    func bindViewModel() {
        // You may want to bind your viewModel to a service/DB here
        //
        // Probably thourght a UseCase or Interactor. I wouldn't do
        // a direct request here.
    }
}
