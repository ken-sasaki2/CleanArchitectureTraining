//
//  UserProfileViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

final class UserProfileViewModel: ObservableObject {
    @Published var isShowUserNameAlert = false
    @Published var isShowGenderAlert = false
    @Published var isShowSuccessSaveUserAlert = false
    @Published var isShowFailSaveUserAlert = false
    
    func showInValidUserNameAlert() {
        isShowUserNameAlert = true
    }
    
    func showInValidGenderAlert() {
        isShowGenderAlert = true
    }
    
    func showSuccessSaveUserAlert() {
        isShowSuccessSaveUserAlert = true
    }
    
    func showFailSaveUserAlert() {
        isShowFailSaveUserAlert = true
    }
}