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
    @Published var isShowNextPage = false
    @Published var isShowFailFetchUserAlert = false
    @Published var userFetchOutputData = UserFetchOutputData(name: "", gender: "", createdDay: "", documentId: "")
    
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
    
    func showNextPage(outputData: UserFetchOutputData) {
        isShowNextPage = true
        userFetchOutputData = outputData
    }
    
    func showFailFetchUserAlert() {
        isShowFailFetchUserAlert = true
    }
}
