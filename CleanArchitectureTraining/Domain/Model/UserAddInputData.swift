//
//  UserAddInputData.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

struct UserAddInputData {
    var name: String
    var gender: Int
    var birthday: String
    var createdAt: TimeInterval
    
    init(name: String, gender: Int, birthday: String, createdAt: TimeInterval) {
        self.name = name
        self.gender = gender
        self.birthday = birthday
        self.createdAt = createdAt
    }
}

