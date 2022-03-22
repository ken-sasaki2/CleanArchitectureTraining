//
//  AuthSignUpResponseTranslatorTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/22.
//

import XCTest

class AuthSignUpResponseTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate() throws {
        let inputs: [AuthResponseTypeEntity] = [
            .success,
            .invalidEmail,
            .weakPassword,
            .emailAlreadyInUse,
            .networkError,
            .otherError
        ]
        
        let expects: [AuthResponseType] = [
            .success,
            .invalidEmail,
            .weakPassword,
            .emailAlreadyInUse,
            .networkError,
            .otherError
        ]
        
        for (index, input) in inputs.enumerated() {
            let expect = expects[index]
            let result = AuthSignUpResponseTranslator.shared.translate(responseTypeEntity: input)
            XCTAssertEqual(result, expect)
        }
    }
}
