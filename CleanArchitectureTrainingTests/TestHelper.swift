//
//  TestHelper.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/06.
//

import FirebaseAuth

struct TestHelper {
    static let uid = Auth.auth().currentUser?.uid ?? ""
    static let name = "test_user"
    static let gender = 1
    static let createdAt = 1646746371.3128781
    static let email = "test_user@example.com"
    static let password = "xxxxxx"
}
