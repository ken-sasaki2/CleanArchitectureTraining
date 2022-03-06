//
//  UserPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

protocol UserPresenterInterface {
    func invalidUserName()
    func invalidGender()
}

final class UserPresenter: UserPresenterInterface {
    private let userViewModel = UserViewModel()
    
    func invalidUserName() {
        
    }
    
    func invalidGender() {
        
    }
}
