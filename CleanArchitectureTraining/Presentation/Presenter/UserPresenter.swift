//
//  UserPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

protocol UserPresenterInterface {
    func isValidateFailure(result: Bool)
}

class UserPresenter: UserPresenterInterface {
    // private let userViewModel = UserViewModel()
    
    func isValidateFailure(result: Bool) {
        print("result:", result)
        // userViewModel.showFailedUseRegistrationAlert(result: result)
    }
}
