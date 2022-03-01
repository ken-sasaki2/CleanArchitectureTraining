//
//  UserDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserDataStoreInterface {
    func saveUser(inputData: UserAddInputData)
    func fetchUser()
    func deleteUser()
}

final class UserDataStore: UserDataStoreInterface {
    private let userRequest = UserRequestToFirestore()
    
    func saveUser(inputData: UserAddInputData) {
        userRequest.saveUser(inputData: inputData)
    }
    
    func fetchUser() {
        
    }
    
    func deleteUser() {
        
    }
}
