//
//  LoginFactory.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 09/07/21.
//

import SwiftUI

enum LoginFactory {
    static func make(with viewModel: LoginViewModel = LoginViewModel()) -> some View {
        let presenter = LoginPresenter(viewModel: viewModel)
        let view = LoginScreen(presenter: presenter)
        return view
    }
}
