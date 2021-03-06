//
//  DemoProjectUITests.swift
//  DemoProjectUITests
//
//  Created by GEORGE QUENTIN on 11/05/2019.
//  Copyright © 2019 GEORGE QUENTIN. All rights reserved.
//


import XCTest
@testable import DemoProject

enum FavouriteElements {
    static let favButton = XCUIApplication().buttons["Favourite"]
    static let noticeText = XCUIApplication().staticTexts["This is your favourite movie"]
}

extension Favourable {
    
    func givenTheAppIsLaunched() {
        XCUIApplication().launch()
    }
    
    func thenIShouldSeeFavouriteButton() {
        XCTAssertTrue(FavouriteElements.favButton.exists)
    }
    
    func whenITapFavouriteButton() {
        FavouriteElements.favButton.tap()
    }
    
    func thenIShouldSeeNoticeMessage() {
        XCTAssertTrue(FavouriteElements.noticeText.exists)
    }
}

class DemoProjectUITests: XCTestCase, Favourable {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieScreenHasFavouriteButton() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        givenTheAppIsLaunched()
        thenIShouldSeeFavouriteButton()
    }
    func testUserShouldGetNoticeMessageOnceFavoured() {
        givenTheAppIsLaunched()
        whenITapFavouriteButton()
        thenIShouldSeeNoticeMessage()
    }
    
}
