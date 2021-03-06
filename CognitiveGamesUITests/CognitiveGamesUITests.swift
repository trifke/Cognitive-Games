//
//  CognitiveGamesUITests.swift
//  CognitiveGamesUITests
//
//  Created by Apple on 12/22/15.
//  Copyright © 2015 Chaotic Neutral. All rights reserved.
//

import XCTest

class CognitiveGamesUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.buttons["PLAY GAME"].tap()
        
        let collectionViewsQuery2 = app.collectionViews
        let collectionViewsQuery = collectionViewsQuery2
        collectionViewsQuery.images["sort"].tap()
        snapshot("Sort0")
        
        let startButton = app.buttons["START"]
        startButton.tap()
        collectionViewsQuery2.children(matching: .cell).element(boundBy: 11).children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery2.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Sort"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        collectionViewsQuery.images["rotating"].tap()
        startButton.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"SWRevealView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1)
        element.tap()
        element.tap()
        app.navigationBars["Rotating"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        collectionViewsQuery.images["numbers"].tap()
        startButton.tap()
        collectionViewsQuery.staticTexts["2"].tap()
        collectionViewsQuery.staticTexts["15"].tap()
        startButton.tap()
        collectionViewsQuery.staticTexts["8"].tap()
        collectionViewsQuery.staticTexts["5"].tap()
        app.navigationBars["Numbers"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        collectionViewsQuery.images["grid"].tap()
        startButton.tap()
        collectionViewsQuery2.children(matching: .cell).element(boundBy: 10).children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery2.children(matching: .cell).element(boundBy: 14).children(matching: .other).element.children(matching: .other).element.tap()
        
        
    }
    
}
