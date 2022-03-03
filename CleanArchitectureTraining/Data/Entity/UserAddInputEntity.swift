//
//  UserAddInputEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/03.
//

import Foundation

struct UserAddInputEntity {
    var name: String
    var gender: String
    var birthday: String
    var createdAt: TimeInterval
    
    init(inputData: UserAddInputData) {
        self.name = inputData.name
        self.gender = inputData.gender
        self.birthday = inputData.birthday
        self.createdAt = inputData.createdAt
    }
}
