//
//  UserAddInputData.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

struct UserAddInputData {
    var uid: String
    var name: String
    var gender: Int
    var createdAt: TimeInterval
    
    init(uid: String, name: String, gender: Int, createdAt: TimeInterval) {
        self.uid = uid
        self.name = name
        self.gender = gender
        self.createdAt = createdAt
    }
}

