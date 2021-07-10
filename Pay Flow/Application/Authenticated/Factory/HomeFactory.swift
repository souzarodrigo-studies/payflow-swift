//
//  HomeFactory.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import SwiftUI

enum HomeFactory {
    static func make(with viewModel: HomeViewModel = HomeViewModel()) -> some View {
        let presenter = HomePresenter(viewModel: viewModel)
        let view = HomeScreen(presenter: presenter)
        return view
    }
}
