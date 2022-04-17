//
//  AuthUserFetchPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/08.
//

import Foundation

protocol AuthUserFetchPresenterInterface {
    func successFetchedUser(model: AuthUserModel)
    func failFetchedUser()
}

final class AuthUserFetchPresenter: AuthUserFetchPresenterInterface {
    let authUserFetchVM: AuthUserFetchViewModel
    
    init(authUserFetchVM: AuthUserFetchViewModel) {
        self.authUserFetchVM = authUserFetchVM
    }
    
    func successFetchedUser(model: AuthUserModel) {
        authUserFetchVM.authUserModel = model
    }
    
    func failFetchedUser() {
        
    }
}
