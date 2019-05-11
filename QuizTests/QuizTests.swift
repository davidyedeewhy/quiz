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
    
    var json: Data?

    override func setUp() {
        super.setUp()
        guard let url = Bundle(for: type(of: self)).url(forResource: "question", withExtension: "json"),
            let data = try? Data(contentsOf: url) else { return }
        json = data
    }

    func testDecoding() {
        do {
            let questions = try JSONDecoder().decode(QuizResponse.self, from: json!)
            XCTAssertNotNil(questions)
        } catch {
            print(error)
            XCTFail()
        }
    }
}
