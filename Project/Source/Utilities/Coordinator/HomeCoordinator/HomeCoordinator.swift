//
//  HomeCoordinator.swift
//  StationaryClient
//
//  Created by Eslam Mohamed on 18/02/2024.
//

import Foundation
import UIKit


protocol HomeCoordinatorContact: AnyObject {
    
    func navigateBack()
    func navigateToRoot()
    func dismiss(completion: (() -> Void)?)
    func showHome()

}

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    
    /// starts the coordinator
    func start() {
        showHome()
    }
    
}
extension HomeCoordinator: HomeCoordinatorContact {
    func showHome() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func dismiss(completion: (() -> Void)?) {
        
    }
    
    func navigateBack() {
        
    }
    
    func navigateToRoot() {
        
    }
    
    
   
    
}
