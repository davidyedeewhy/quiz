//
//  QuizTests.swift
//  QuizTests
//
//  Created by David Ye on 11/5/19.
//  Copyright © 2019 David Ye. All rights reserved.
//

import XCTest
@testable import Quiz

class QuizTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func testDecoding() {
        // GIvEN
        let viewModel = QuestionsViewModel()
        
        // THEN
        XCTAssertNotNil(viewModel)
    }
    
    func testsubscript() {
        // GIVEN
        let viewModel = QuestionsViewModel()
        
        // THEN
        viewModel.questions?.enumerated().forEach { (index, question) in
            XCTAssertEqual(question, viewModel[index])
        }
    }
    
    func testCheckAnswer() {
        // GIVEN
        let viewModel = QuestionsViewModel()
        
        // THEN
        viewModel.questions?.forEach { question in
            if question.answer {
                XCTAssertTrue(question.checkAnswer("true"))
            } else {
                XCTAssertTrue(question.checkAnswer("false"))
            }
        }
    }
}
