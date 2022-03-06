//
//  RepositoryLocator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/01.
//

import Foundation

final class RepositoryLocator {
    static let shared = RepositoryLocator()
    
    private init() {}
    
    func getUserDataStoreImpl() -> UserDataStoreInterface {
        UserDataStore()
    }
    
    func getUserRepository() -> UserRepositoryInterface {
        UserRepository()
    }
    
    func getUserAddUseCase() -> UserAddUseCaseInterface {
        UserAddUseCase()
    }
    
    func getUserPresenter() -> UserPresenterInterface {
        UserPresenter()
    }
    
//    func getUserViewModel() -> UserViewModelInterface {
//        UserViewModel()
//    }
}
