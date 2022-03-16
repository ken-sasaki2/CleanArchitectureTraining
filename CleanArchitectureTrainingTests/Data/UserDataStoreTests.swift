//
//  UserDataStoreTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/17.
//

import XCTest

class UserDataStoreTests: XCTestCase {
    private let userDataStore = UserDataStore()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetIsUserDataSaved() throws {
        XCTContext.runActivity(named: "isSavedがtrueの場合") { _ in
            userDataStore.setIsUserDataSaved(isSaved: true)
            let isUserDataSaved = userDataStore.getIsUserDataSaved()
            XCTAssert(isUserDataSaved == true)
        }
        XCTContext.runActivity(named: "isSavedがfalseの場合") { _ in
            userDataStore.setIsUserDataSaved(isSaved: false)
            let isUserDataSaved = userDataStore.getIsUserDataSaved()
            XCTAssert(isUserDataSaved == false)
        }
    }
}
