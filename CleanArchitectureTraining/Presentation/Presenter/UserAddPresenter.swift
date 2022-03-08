//
//  UserAddPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

protocol UserAddPresenterInterface {
    func invalidUserName()
    func invalidGender()
    func successSaveUser()
    func failSaveUser()
}

final class UserAddPresenter: UserAddPresenterInterface {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func invalidUserName() {
        userProfileVM.showInValidUserNameAlert()
    }
    
    func invalidGender() {
        userProfileVM.showInValidGenderAlert()
    }
    
    func successSaveUser() {
        userProfileVM.showSuccessSaveUserAlert()
    }
    
    func failSaveUser() {
        userProfileVM.showFailSaveUserAlert()
    }
}
