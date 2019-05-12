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
    private var questionIndex = 0
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if let question = viewModel.questions?.first {
            showQuestion(question)
        }
    }
    
    // MARK: - functions
    
    private func showQuestion(_ question: QuizViewModel) {
        title = "Question \(questionIndex + 1)"
        questionLabel.text = question.question
        resultLabel.text = nil
    }
    
    @IBAction private func didTapDone(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction private func didAnswer(_ sender: UIButton) {
        guard let question = viewModel[questionIndex],
            let title = sender.title(for: .normal)
            else { return }
        let isCorrectAnswer = question.checkAnswer(title)
        resultLabel.text = "Your answer is \(isCorrectAnswer ? "right" : "wrong")"
        questionIndex += 1
        delegate?.updateScore(isCorrectAnswer)
    }
    
    @IBAction private func didTapNext(_ sender: UIButton) {
        if let question = viewModel[questionIndex] {
            showQuestion(question)
        } else {
            dismiss(animated: true)
        }
    }

}
