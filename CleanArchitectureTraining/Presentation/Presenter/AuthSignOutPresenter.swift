//
//  AuthSignOutPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/06.
//

import Foundation

protocol AuthSignOutPresenterInterface {
    func successSignOut()
    func failSignOut()
}

final class AuthSignOutPresenter: AuthSignOutPresenterInterface {
    let authSignOutVM: AuthSignOutViewModel
    
    init(authSignOutVM: AuthSignOutViewModel) {
        self.authSignOutVM = authSignOutVM
    }
    
    func successSignOut() {
        authSignOutVM.isShowSuccessSignOutAlert = true
    }
    
    func failSignOut() {
        authSignOutVM.isShowFailSignOutAlert = true
    }
}
