//
//  AuthRequestToFirebaseTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/20.
//

import XCTest

class AuthRequestToFirebaseTests: XCTestCase {
    private let authRequestToFirebase = AuthRequestToFirebase()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUp_responseIsSuccess() async throws {
        try XCTSkipIf(true, "Firebaseに登録済みの場合テストが失敗するのでスキップ")
        let request = AuthRequestEntity(email: TestHelper.email, password: TestHelper.password)
        let response = await authRequestToFirebase.signUp(requestEntity: request)
        print("Success test sign up.")
        XCTAssert(response == .success)
    }
    
    func testSignUp_responseIsInvalidEmail() async throws {
        let request = AuthRequestEntity(email: "test_user@", password: TestHelper.password)
        let response = await authRequestToFirebase.signUp(requestEntity: request)
        print("Fail invalid email.")
        XCTAssert(response == .invalidEmail)
    }
    
    func testSignUp_responseIsWeakPassword() async throws {
        let request = AuthRequestEntity(email: TestHelper.email, password: "xxxxx")
        let response = await authRequestToFirebase.signUp(requestEntity: request)
        print("Fail weak password.")
        XCTAssert(response == .weakPassword)
    }
    
    func testSignUp_responseIsEmailAlreadyInUse() async throws {
        let request = AuthRequestEntity(email: "email_already_in_use@example.com", password: TestHelper.password)
        let response = await authRequestToFirebase.signUp(requestEntity: request)
        print("Fail email already in use.")
        XCTAssert(response == .emailAlreadyInUse)
    }
    
    func testSignIn_responseIsSuccess() async throws {
        let request = AuthRequestEntity(email: TestHelper.email, password: TestHelper.password)
        let response = await authRequestToFirebase.signIn(requestEntity: request)
        print("Success test sign in.")
        XCTAssert(response == .success)
    }
}
