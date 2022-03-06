//
//  UserViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/05.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var isValidateFailure: Bool
    
    init() {
        isValidateFailure = false
    }
    
    func showFailedUseRegistrationAlert(result: Bool) {
        self.isValidateFailure = result
    }
}
