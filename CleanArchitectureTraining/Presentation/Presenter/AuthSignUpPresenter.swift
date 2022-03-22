//
//  AuthSignUpPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

protocol AuthSignUpPresenterInterface {
    func successSignUp()
    func failInvalidEmail()
    func failWeakPassword()
    func failEmailAlreadyInUse()
    func failNetworkError()
    func failOtherError()
}

final class AuthSignUpPresenter: AuthSignUpPresenterInterface {
    let authSignUpVM: AuthSignUpViewModel
    
    init(authSignUpVM: AuthSignUpViewModel) {
        self.authSignUpVM = authSignUpVM
    }
    
    func successSignUp() {
        authSignUpVM.isShowSuccessSignUpAlert = true
    }
    
    func failInvalidEmail() {
        authSignUpVM.isShowFailInvalidEmailAlert = true
    }
    
    func failWeakPassword() {
        authSignUpVM.isShowFailWeakPasswordAlert = true
    }
    
    func failEmailAlreadyInUse() {
        authSignUpVM.isShowFailEmailAlreadyInUseAlert = true
    }
    
    func failNetworkError() {
        authSignUpVM.isShowFailNetworkErrorAlert = true
    }
    
    func failOtherError() {
        authSignUpVM.isShowFailOtherErrorAlert = true
    }
}
