//
//  codeUITests.swift
//  codeUITests
//
//  Created by indraneel potnis on 04/01/22.
//

import XCTest

class codeUITests: XCTestCase {

    func testLineGetsInsertedWhileTyping() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abcdef")
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))

    }
    
    func testSizeOfCodeDoesNotExceedLimit() throws {
       
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abcdeferw")
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))
            
    }
    
    func testSaveCode() throws {
      
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abcdef")
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))
        
        app.terminate()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["codeLabel"].exists)
        XCTAssertEqual("abc-def", (app.staticTexts["codeLabel"].label))
    }
    
    
    func testShuffleCode() throws {
        
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abcdef")
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))
        
        app.buttons["Popup"].tap()
        app.buttons["Shuffle"].tap()
        
        XCTAssertEqual("def-abc", (app.textFields["codeTextField"].value as! String))
        
        app.terminate()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["codeLabel"].exists)
        XCTAssertEqual("def-abc", (app.staticTexts["codeLabel"].label))
    }
    
    func testDismissCode() throws {

        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abcdef")
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))
        
        app.buttons["Popup"].tap()
        app.buttons["Dismiss"].tap()
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))
        
        app.terminate()
        app.launch()
        
        XCTAssertTrue(app.staticTexts["codeLabel"].exists)
        XCTAssertEqual("abc-def", (app.staticTexts["codeLabel"].label))
    }
    
    func testLandscapeIcon() throws {
        
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abcdef")
        
        XCTAssertEqual("abc-def", (app.textFields["codeTextField"].value as! String))
        
        app.buttons["Popup"].tap()
        
        XCTAssertTrue(app.images["imageIcon"].isHittable)
        
        XCUIDevice.shared.orientation = .landscapeLeft
        
        XCTAssertFalse(app.images["imageIcon"].isHittable)
        
        XCUIDevice.shared.orientation = .portrait
        
        XCTAssertTrue(app.images["imageIcon"].isHittable)
    }
    
    func testInvalidCodeDoesNotTriggerPopup() throws {
       
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        
        app.textFields["codeTextField"].tap()
        app.textFields["codeTextField"].typeText("abc")
        
        XCTAssertEqual("abc", (app.textFields["codeTextField"].value as! String))
        
        app.buttons["Popup"].tap()
        
        XCTAssertFalse(app.images["imageIcon"].exists)
        
    }

}
