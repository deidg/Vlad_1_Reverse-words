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

    // выполняется ли функция defaultConfigurationIsValid()
    func testDefaultConfigurationIsValid () {
        
        let sut = mainViewController()
        sut.defaultConfiguration()
        
        let defaultConfigurationIsValid = sut.defaultConfiguration
        
        XCTAssertTrue(defaultConfigurationIsValid() == sut.defaultConfiguration())
    }
    
    //???? проверка на то, что поле reverseTextField пустое
//    func testReverseTextFieldIsEmpty() {
//        let sut = mainViewController().reverseTextField.text
//
//        let testReverseTextFieldIsEmpty = ""
//        XCTAssertTrue(sut == testReverseTextFieldIsEmpty) //(sut, testReverseTextFieldIsEmpty)
//    }
    
    // IsAnswerTextViewEditable?
    func testIsAnswerTextViewEditable() {
        let sut = mainViewController().answerTextView.isEditable

        let IsAnswerTextViewEditable = false
        XCTAssert(sut == IsAnswerTextViewEditable) //(sut, testReverseTextFieldIsEmpty)
    }
}
  

// IsreverseButtonInActivce?





//GIVEN

//WHEN

//THEN
