//
//  QuizViewModel.swift
//  Quiz
//
//  Created by David Ye on 11/5/19.
//  Copyright © 2019 David Ye. All rights reserved.
//

import Foundation

class QuestionsViewModel {
    let domain: Domain?
    let questions: [QuizViewModel]?
    
    init() {
        guard let url = Bundle.main.path(forResource: "question", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: url)),
            let content = try? JSONDecoder().decode(QuizResponse.self, from: data) else {
                domain = nil
                questions = nil
                return
        }
        domain = content.domain
        questions = content.questions.map { QuizViewModel($0) }
    }
    
    subscript(_ index: Int) -> QuizViewModel? {
        guard let questions = questions, index < questions.count else { return nil }
        return questions[index]
    }
}

struct QuizViewModel: Equatable {
    
    let question: String
    let answer: Bool
    
    init(_ quiz: Quiz) {
        self.question = quiz.question
        self.answer = quiz.answer
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        return self.answer.description == answer.lowercased()
    }
    
}

