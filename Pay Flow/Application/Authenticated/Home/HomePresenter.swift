//
//  HomePresenter.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 10/07/21.
//

import Foundation

protocol HomePresenting: ObservableObject {
    var viewModel: HomeViewModel { get }
}

final class HomePresenter: HomePresenting {
    
    @Published private(set) var viewModel: HomeViewModel {
        didSet { }
    }
    
    init(viewModel: HomeViewModel) {
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
