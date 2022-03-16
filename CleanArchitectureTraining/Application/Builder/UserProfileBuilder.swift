//
//  UserProfileBuilder.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/08.
//

import Foundation

final class UserProfileBuilder {
    static let shared = UserProfileBuilder()
    
    private init() {}
    
    func build() -> UserProfileView {
        let viewModel = UserProfileViewModel()
        let view = UserProfileView(
            userProfileVM: viewModel,
            userProfileController: UserProfileController(
                userAddUseCase: UserAddUseCase(
                    userRepository: UserRepository(),
                    userAddPresenter: UserAddPresenter(
                        userProfileVM: viewModel)),
                userFetchUseCase: UserFetchUseCase(
                    userRepository: UserRepository(),
                    userFetchPresenter: UserFetchPresenter(
                        userProfileVM: viewModel)
                )
            )
        )
        return view
    }
}
