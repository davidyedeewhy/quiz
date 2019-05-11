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
    private var viewModel = QuestionsViewModel()
    private var questionIndex = 0
    private var questionLabel: UILabel?
    private var resultLabel: UILabel?
    
    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - functions
    
    private func configure() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        questionLabel = UILabel(frame: CGRect(x: 30 , y: view.frame.size.height * 0.25, width: view.frame.size.width - 60, height: 100))
        questionLabel?.numberOfLines = 0
        questionLabel?.textColor = .black
        questionLabel.map { view.addSubview($0) }
        let trueButton = UIButton(frame: CGRect(x: 0, y: view.frame.size.height * 0.25 + 100, width: view.frame.size.width * 0.5, height: 60))
        trueButton.setTitle("True", for: .normal)
        trueButton.setTitleColor(.blue, for: .normal)
        let falseButton = UIButton(frame: CGRect(x: view.frame.size.width * 0.5, y: view.frame.size.height * 0.25 + 100, width: view.frame.size.width * 0.5, height: 60))
        falseButton.setTitle("False", for: .normal)
        falseButton.setTitleColor(.blue, for: .normal)
        [trueButton, falseButton].forEach {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(didAnswer), for: .touchUpInside)
        }
        resultLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.8, width: view.frame.width, height: 20))
        resultLabel?.textAlignment = .center
        resultLabel.map { view.addSubview($0) }
        let nextButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.9, width: view.frame.width, height: 30))
        nextButton.setTitle("Next Question", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        view.addSubview(nextButton)
        if let question = viewModel.next(questionIndex) {
            showQuestion(question)
        }
    }
    
    private func showQuestion(_ question: QuizViewModel) {
        title = "Question \(questionIndex + 1)"
        questionLabel?.text = question.question
        resultLabel?.text = nil
    }
    
    @IBAction private func didTapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func didAnswer(_ sender: UIButton) {
        var isRight: Bool?
        switch sender.title(for: .normal) {
        case "True":
            isRight = viewModel.questions?[questionIndex].answer
        case "False":
            isRight = viewModel.questions.map { !$0[questionIndex].answer }
        default:
            break
        }
        guard let isRightAnswer = isRight else { return }
        resultLabel?.text = "Your answer is \(isRightAnswer ? "right" : "wrong")"
        questionIndex += 1
        delegate?.updateResult(isRightAnswer)
    }
    
    @IBAction private func didTapNext(_ sender: UIButton) {
        if let question = viewModel.next(questionIndex) {
            showQuestion(question)
        } else {
            dismiss(animated: true)
        }
    }

}
