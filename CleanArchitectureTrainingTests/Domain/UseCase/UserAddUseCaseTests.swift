//
//  UserAddUseCaseTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/06.
//

import XCTest

class UserAddUseCaseTests: XCTestCase {
    private let userAddUseCase = UserAddUseCase(userRepository: UserRepository(), userAddPresenter: UserAddPresenter(userProfileVM: UserProfileViewModel()))

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidUserName() throws {
        XCTContext.runActivity(named: "nameが2文字以上10文字以下の場合") { _ in
            let result = userAddUseCase.isValidUserName(name: TestHelper.name)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named:"nameが2文字未満の場合") { _ in
            let input = "x"
            let result = userAddUseCase.isValidUserName(name: input)
            XCTAssert(result == false)
        }
        XCTContext.runActivity(named:"nameが10文字超過の場合") { _ in
            let input = "xxxxx_xxxxx"
            let result = userAddUseCase.isValidUserName(name: input)
            XCTAssert(result == false)
        }
    }
    
    func testIsValidGender() throws {
        XCTContext.runActivity(named: "genderが0の場合") { _ in
            let result = userAddUseCase.isValidGender(gender: 0)
            XCTAssert(result == false)
        }
        XCTContext.runActivity(named: "genderが1の場合") { _ in
            let result = userAddUseCase.isValidGender(gender: 1)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named: "genderが2の場合") { _ in
            let result = userAddUseCase.isValidGender(gender: 2)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named: "genderが3の場合") { _ in
            let result = userAddUseCase.isValidGender(gender: 3)
            XCTAssert(result == true)
        }
    }
}
