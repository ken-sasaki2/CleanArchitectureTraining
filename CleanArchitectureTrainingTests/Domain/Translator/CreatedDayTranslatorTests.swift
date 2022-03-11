//
//  CreatedDayTranslatorTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/10.
//

import XCTest

class CreatedDayTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate() throws {
        let input = TestHelper.createdAt
        let result = CreatedDayTranslator.shared.translate(createdAt: input)
        XCTAssertEqual(result, "2022年3月8日")
    }
}
