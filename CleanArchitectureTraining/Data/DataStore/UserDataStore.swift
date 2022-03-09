//
//  UserDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserDataStoreInterface {
    func saveUser(inputData: UserAddInputData) async throws -> Void 
    func fetchUser() async throws -> UserFetchOutputEntity
    func deleteUser()
}

final class UserDataStore: UserDataStoreInterface {
    private let userRequest = UserRequestToFirestore()
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            let inputEntity = UserAddInputEntity(inputData: inputData)
            try await userRequest.saveUser(inputEntity: inputEntity)
            return
        } catch {
            throw error
        }
    }
    
    func fetchUser() async throws -> UserFetchOutputEntity {
        do {
            let outputEntity = try await userRequest.fetchUser()
            return outputEntity
        } catch {
            throw error
        }
    }
    
    func deleteUser() {
        
    }
}
