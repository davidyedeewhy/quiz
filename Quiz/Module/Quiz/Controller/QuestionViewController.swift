//
//  QuestionViewController.swift
//  Quiz
//
//  Created by David Ye on 11/5/19.
//  Copyright © 2019 David Ye. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - variables
    
    weak var delegate: ResultDelegate?
    private let viewModel = QuestionsViewModel()
    var questionIndex = 0
    private var isAnswered = false
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if let question = viewModel[questionIndex] {
            showQuestion(question)
        }
    }
    
    // MARK: - functions
    
    private func showQuestion(_ question: QuizViewModel) {
        title = "Question \(questionIndex + 1)"
        questionLabel.text = [viewModel.domain.map { $0.rawValue }, question.question]
            .compactMap { $0 }
            .joined(separator: "\n")
        resultLabel.text = nil
    }
    
    @IBAction private func didTapDone(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction private func didAnswer(_ sender: UIButton) {
        guard let question = viewModel[questionIndex],
            let title = sender.title(for: .normal),
            !isAnswered
            else { return }
        isAnswered = true
        let isCorrectAnswer = question.checkAnswer(title)
        resultLabel.text = "Your answer is \(isCorrectAnswer ? "right" : "wrong")"
        questionIndex += 1
        delegate?.updateScore(isCorrectAnswer)
    }
    
    @IBAction private func didTapNext(_ sender: UIButton) {
        if let question = viewModel[questionIndex] {
            isAnswered = false
            showQuestion(question)
        } else {
            dismiss(animated: true)
        }
    }

}
