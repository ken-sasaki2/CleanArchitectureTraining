//
//  UserAddUseCaseTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/06.
//

import XCTest

class UserAddUseCaseTests: XCTestCase {
    private let userAddUseCase = UserUseCase()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidateUserName() throws {
        XCTContext.runActivity(named: "nameが2文字以上10文字以下の場合") { _ in
            let inputData = UserAddInputData(name: "sasaki.ken", gender: 1, birthday: "1996年2月22日", createdAt: Date().timeIntervalSince1970)
            let result = userAddUseCase.isValidateUserName(inputData: inputData)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named:"nameが2文字未満の場合") { _ in
            let inputData = UserAddInputData(name: "A", gender: 1, birthday: "1996年2月22日", createdAt: Date().timeIntervalSince1970)
            let result = userAddUseCase.isValidateUserName(inputData: inputData)
            XCTAssert(result == false)
        }
        XCTContext.runActivity(named:"nameが10文字以上の場合") { _ in
            let inputData = UserAddInputData(name: "sasaki.t", gender: 1, birthday: "1996年2月22日", createdAt: Date().timeIntervalSince1970)
            let result = userAddUseCase.isValidateUserName(inputData: inputData)
            XCTAssert(result == false)
        }
    }
}
