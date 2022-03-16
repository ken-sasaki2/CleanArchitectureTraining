//
//  UserFetchPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/12.
//

import Foundation

protocol UserFetchPresenterInterface {
    func outputUserData(outputData: UserFetchOutputData)
    func failFetchUser()
    func outputIsUserDataSaved(isSaved: Bool)
}

final class UserFetchPresenter: UserFetchPresenterInterface {
    var userProfileVM: UserProfileViewModel
    
    init(userProfileVM: UserProfileViewModel) {
        self.userProfileVM = userProfileVM
    }
    
    func outputUserData(outputData: UserFetchOutputData) {
        userProfileVM.isShowNextPage = true
        userProfileVM.userFetchOutputData = outputData
    }
    
    func failFetchUser() {
        userProfileVM.isShowFailSaveUserAlert = true
    }
    
    func outputIsUserDataSaved(isSaved: Bool) {
        userProfileVM.isUserDataSaved = isSaved
    }
}
