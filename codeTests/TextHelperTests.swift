//
//  TextHelperTests.swift
//  codeTests
//
//  Created by indraneel potnis on 04/01/22.
//

import XCTest
@testable import code
class TextHelperTests : XCTestCase {
    
    func testValidCode() {
        XCTAssertTrue(TextHelper.checkValidCode(code: "abc-def")) 
    }
    
    func testInValidCode() {
        XCTAssertFalse(TextHelper.checkValidCode(code: "abcdef"))
    }
    
    func testInValidCode2() {
        XCTAssertFalse(TextHelper.checkValidCode(code: "abc-defa"))
    }
    
    func testInValidCode3() {
        XCTAssertFalse(TextHelper.checkValidCode(code: "abcd-def"))
    }
    
    func testInValidCode4() {
        XCTAssertFalse(TextHelper.checkValidCode(code: ""))
    }
    
    func testShuffle() {
        XCTAssertEqual("def-abc", TextHelper.shuffleString(code: "abc-def"))
    }
}
