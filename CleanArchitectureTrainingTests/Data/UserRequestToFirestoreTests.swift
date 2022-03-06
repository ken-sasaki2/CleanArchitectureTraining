//
//  UserRequestToFirestoreTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/06.
//

import XCTest

class UserRequestToFirestoreTests: XCTestCase {
    private let firestore = UserRequestToFirestore()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveUser() async throws {
        let inputData = UserAddInputData(name: "test_user", gender: 1, createdAt: Date().timeIntervalSince1970)
        let inputEntity = UserAddInputEntity(inputData: inputData)
        do {
            try await firestore.saveUser(inputEntity: inputEntity)
            print("Success test save user.")
        } catch {
            XCTFail("Fail test save user.")
        }
    }
}
