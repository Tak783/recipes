//
//  RecipesClientUITests.swift
//  RecipesClientUITests
//
//  Created on 21/05/2025.
//

@testable import RecipesClient
import SwiftUI
import XCTest

final class LaunchViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
}

extension LaunchViewUITests {
    func test_launch_labelsHaveExpectedTitle() throws {
        XCTAssertTrue(app.staticTexts["Welcome to!"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["Recipes"].exists)
        XCTAssertTrue(app.staticTexts["Eating healthily\nmade easy"].exists)
    }
    
    func test_getStartedButton_labelHasExpectedTitle() throws {
        let button = app.buttons["Get Started"]
        XCTAssertTrue(button.waitForExistence(timeout: 1))
    }
    
    func test_getStartedButton_onTap_navigatesToRecipeFeed() throws {
        let button = app.buttons["Get Started"]
        XCTAssertTrue(button.waitForExistence(timeout: 1))
        button.tap()

        let recipeFeedHeader = app.staticTexts["Recipes"]
        XCTAssertTrue(recipeFeedHeader.waitForExistence(timeout: 2))
    }
}
