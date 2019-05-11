//
//  Quiz.swift
//  Quiz
//
//  Created by David Ye on 11/5/19.
//  Copyright © 2019 David Ye. All rights reserved.
//

import Foundation

enum Domain: String, Decodable {
    case swift
}

struct QuizResponse: Decodable {
    let domain: Domain
    let questions: [Quiz]
    
    private enum CodingKeys: String, CodingKey {
        case domain
        case questions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decode(Domain.self, forKey: .domain)
        questions = try container.decode([Quiz].self, forKey: .questions)
    }
}

struct Quiz: Decodable {
    let question: String
    let answer: Bool
    
    private enum CodingKeys: String, CodingKey {
        case question
        case answer
    }
}
