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
    
    func testCreateUser_responseIsSuccess() async throws {
        try XCTSkipIf(true, "Firebaseに登録済みの場合テストが失敗するのでスキップ")
        let authEntity = AuthCreateUserEntity(email: TestHelper.email, password: TestHelper.password)
        let response = await authRequestToFirebase.createUser(authEntity: authEntity)
        print("Success test create user.")
        XCTAssert(response == .success)
    }
    
    func testCreateUser_responseIsInvalidEmail() async throws {
        let authEntity = AuthCreateUserEntity(email: "test_user@", password: TestHelper.password)
        let response = await authRequestToFirebase.createUser(authEntity: authEntity)
        print("Fail invalid email.")
        XCTAssert(response == .invalidEmail)
    }
    
    func testCreateUser_responseIsWeakPassword() async throws {
        let authEntity = AuthCreateUserEntity(email: TestHelper.email, password: "xxxxx")
        let response = await authRequestToFirebase.createUser(authEntity: authEntity)
        print("Fail weak password.")
        XCTAssert(response == .weakPassword)
    }
    
    func testCreateUser_responseIsEmailAlreadyInUse() async throws {
        let authEntity = AuthCreateUserEntity(email: "email_already_in_use@example.com", password: TestHelper.password)
        let response = await authRequestToFirebase.createUser(authEntity: authEntity)
        print("Fail email already in use.")
        XCTAssert(response == .emailAlreadyInUse)
    }
}
