//
//  UserDeletePresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/17.
//

import Foundation

protocol UserDeletePresenterInterface {
    func successDeleteUser()
    func failDeleteUser()
}

final class UserDeletePresenter: UserDeletePresenterInterface {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func successDeleteUser() {
        userProfileVM.isShowSuccessDeleteUser = true
    }
    
    func failDeleteUser() {
        userProfileVM.isShowFailDeleteUser = true
    }
}
