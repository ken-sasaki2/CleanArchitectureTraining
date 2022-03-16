//
//  UserFetchUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/12.
//

import Foundation

protocol UserFetchUseCaseInterface {
    func fetchUser() async throws -> Void
    func getIsUserDataSaved()
}

final class UserFetchUseCase: UserFetchUseCaseInterface {
    private let userRepository: UserRepositoryInterface
    private let userFetchPresenter: UserFetchPresenterInterface
    
    init(userRepository: UserRepositoryInterface, userFetchPresenter: UserFetchPresenterInterface) {
        self.userRepository = userRepository
        self.userFetchPresenter = userFetchPresenter
    }
    
    func fetchUser() async throws -> Void {
        do {
            let entity = try await userRepository.fetchUser()
            let outputData = UserFetchOutputDataTranslator.shared.translate(entity: entity)
            userFetchPresenter.outputUserData(outputData: outputData)
            return
        } catch {
            userFetchPresenter.failFetchUser()
        }
    }
    
    func getIsUserDataSaved() {
        let isSaved = userRepository.getIsUserDataSaved()
        userFetchPresenter.outputIsUserDataSaved(isSaved: isSaved)
    }
}
