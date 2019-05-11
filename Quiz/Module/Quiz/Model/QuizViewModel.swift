//
//  QuizViewModel.swift
//  Quiz
//
//  Created by David Ye on 11/5/19.
//  Copyright © 2019 David Ye. All rights reserved.
//

import Foundation

class QuestionsViewModel {
    var domain: Domain?
    var questions: [QuizViewModel]?
    
    init() {
        if let url = Bundle.main.path(forResource: "question", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: url)),
            let content = try? JSONDecoder().decode(QuizResponse.self, from: data)
        {
            domain = content.domain
            questions = content.questions.map { QuizViewModel($0) }
        }
    }
}

struct QuizViewModel {
    
    let question: String
    let answer: Bool
    
    init(_ quiz: Quiz) {
        self.question = quiz.question
        self.answer = quiz.answer
    }
    
}
