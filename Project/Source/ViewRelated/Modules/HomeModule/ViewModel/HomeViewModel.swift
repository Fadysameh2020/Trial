//
//  HomeViewModel.swift
//  Driver
//
//  Created by Eslam Mohamed on 22/05/2024.
//

import Foundation

final class HomeViewModel: BaseViewModelProtocol {
    
    var viewStatesPublisher: PassthroughSubject<ViewState, Never> = .init()
    
    var coordinator: HomeCoordinatorContact?
    
    init(coordinator: HomeCoordinatorContact? = nil) {
        self.coordinator = coordinator
    }
    
    func viewModelDidLoad() {
        
    }
    
    
}
