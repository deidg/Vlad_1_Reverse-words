//
//  Vlad_1_Reverse_wordsTests.swift
//  Vlad_1_Reverse wordsTests
//
//  Created by Alex on 29.12.2022.
//

import XCTest
@testable import Vlad_1_Reverse_words

final class Vlad_1_Reverse_wordsTests: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {

        super.tearDown()
    }

    func defaultConfigurationIsValid () {
        let sut = mainViewController()
        sut.defaultConfiguration()
        
        let defaultConfigurationIsValid: () = sut.defaultConfiguration()
        XCTAssertTrue(defaultConfigurationIsValid == sut.defaultConfiguration())
        
    }
    
    
}
