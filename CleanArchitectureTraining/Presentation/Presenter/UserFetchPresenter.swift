//
//  UserFetchPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/12.
//

import Foundation

protocol UserFetchPresenterInterface {
    func outputUserData(outputData: UserFetchOutputData)
}

final class UserFetchPresenter: UserFetchPresenterInterface {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func outputUserData(outputData: UserFetchOutputData) {
        userProfileVM.userFetchOutputData = outputData
    }
}
