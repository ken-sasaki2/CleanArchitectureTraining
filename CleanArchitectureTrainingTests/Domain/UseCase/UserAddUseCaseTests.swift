//
//  UserAddUseCaseTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/06.
//

import XCTest

class UserAddUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidUserName() throws {
        let dataStore = UserDataStore()
        let repository = UserRepository(userDataStore: dataStore)
        let viewModel = UserProfileViewModel()
        let output = UserAddPresenter(userProfileVM: viewModel)
        let useCase = UserAddUseCase(userRepository: repository, output: output)
        
        XCTContext.runActivity(named: "nameが2文字以上10文字以下の場合") { _ in
            let name = "xx"
            let result = useCase.isValidUserName(name: name)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named:"nameが2文字未満の場合") { _ in
            let name = "x"
            let result = useCase.isValidUserName(name: name)
            XCTAssert(result == false)
        }
        XCTContext.runActivity(named:"nameが10文字超過の場合") { _ in
            let name = "xxxxxxxxxxx"
            let result = useCase.isValidUserName(name: name)
            XCTAssert(result == false)
        }
    }
    
    func testIsValidGender() throws {
        let dataStore = UserDataStore()
        let repository = UserRepository(userDataStore: dataStore)
        let viewModel = UserProfileViewModel()
        let output = UserAddPresenter(userProfileVM: viewModel)
        let useCase = UserAddUseCase(userRepository: repository, output: output)

        XCTContext.runActivity(named: "genderが0の場合") { _ in
            let result = useCase.isValidGender(gender: 0)
            XCTAssert(result == false)
        }
        XCTContext.runActivity(named: "genderが1の場合") { _ in
            let result = useCase.isValidGender(gender: 1)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named: "genderが2の場合") { _ in
            let result = useCase.isValidGender(gender: 2)
            XCTAssert(result == true)
        }
        XCTContext.runActivity(named: "genderが3の場合") { _ in
            let result = useCase.isValidGender(gender: 3)
            XCTAssert(result == true)
        }
    }
}
