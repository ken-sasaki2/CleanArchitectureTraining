//
//  GenderTranslatorTests.swift
//  CleanArchitectureTrainingTests
//
//  Created by sasaki.ken on 2022/03/10.
//

import XCTest

class GenderTranslatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate() throws {
        let inputs = [0, 1, 2, 3]
        let expects = ["", "男性", "女性", "選ばない"]
        
        for (index, input) in inputs.enumerated() {
            let expect = expects[index]
            let result = GenderTranslator.shared.translate(gender: input)
            XCTAssertEqual(result, expect)
        }
    }
}
