//
//  UserFetchOutputDataTranslatorTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/10.
//

import XCTest

class UserFetchOutputDataTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate() throws {
        let entity = UserFetchOutputEntity(
            uid: TestHelper.uid,
            name: TestHelper.name,
            gender: TestHelper.gender,
            createdAt: TestHelper.createdAt,
            documentId: ""
        )
        let data = UserFetchOutputDataTranslator.shared.translate(entity: entity)
        XCTAssertEqual(data.uid, TestHelper.uid)
        XCTAssert(data.name == "test_user")
        XCTAssert(data.gender == "男性")
        XCTAssert(data.createdDay == "2022年3月8日")
    }
}
