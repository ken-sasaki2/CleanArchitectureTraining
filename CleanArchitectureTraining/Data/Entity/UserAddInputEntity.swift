//
//  UserAddInputEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/03.
//

import Foundation

struct UserAddInputEntity {
    var uid: String
    var name: String
    var gender: Int
    var createdAt: TimeInterval
    
    init(inputData: UserAddInputData) {
        self.uid = inputData.uid
        self.name = inputData.name
        self.gender = inputData.gender
        self.createdAt = inputData.createdAt
    }
}
