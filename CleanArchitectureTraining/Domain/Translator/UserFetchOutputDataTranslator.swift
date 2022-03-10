//
//  UserFetchOutputDataTranslator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/09.
//

import Foundation

final class UserFetchOutputDataTranslator {
    static let shared = UserFetchOutputDataTranslator()
    
    private init() {}
    
    func translate(entity: UserFetchOutputEntity) -> UserFetchOutputData {
        let gender = GenderTranslator.shared.translate(gender: entity.gender)
        let createdDate = CreatedDateTranslator.shared.translate(createdAt: entity.createdAt)
        let outputData = UserFetchOutputData(name: entity.name, gender: gender, createdDate: createdDate, documentId: entity.documentId)
        
        return outputData
    }
}
