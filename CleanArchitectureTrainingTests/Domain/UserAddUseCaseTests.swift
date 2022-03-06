//
//  UserAddUseCaseTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/06.
//

import XCTest

class UserAddUseCaseTests: XCTestCase {
    private let userAddUseCase = UserAddUseCase()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidateUserName() throws {
        XCTContext.runActivity(named: "nameが2文字以上10文字以下の場合") { _ in
            let inputData = UserAddInputData(name: TestHelper.name, gender: TestHelper.gender, createdAt: TestHelper.createdAt)
            let result = userAddUseCase.isValidUserName(inputData: inputData)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named:"nameが2文字未満の場合") { _ in
            let inputData = UserAddInputData(name: "A", gender: 1, createdAt: Date().timeIntervalSince1970)
            let result = userAddUseCase.isValidUserName(inputData: inputData)
            XCTAssert(result == false)
        }
        XCTContext.runActivity(named:"nameが10文字超過の場合") { _ in
            let inputData = UserAddInputData(name: "sasaki.test", gender: 1, createdAt: Date().timeIntervalSince1970)
            let result = userAddUseCase.isValidUserName(inputData: inputData)
            XCTAssert(result == false)
        }
    }
}
