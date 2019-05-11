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
    
    private var viewModel = QuestionsViewModel()
    private var questionLabel: UILabel?
    private var resultLabel: UILabel?
    
    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - functions
    
    private func configure() {
        title = "Question"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        questionLabel = UILabel(frame: CGRect(x: 30 , y: view.frame.size.height * 0.25, width: view.frame.size.width - 60, height: 0))
        questionLabel?.numberOfLines = 0
        questionLabel?.textColor = .black
        questionLabel.map { view.addSubview($0) }
        showQuestion()
    }
    
    private func showQuestion() {
        if let question = viewModel.questions?.first {
            questionLabel?.text = question.question
        }
    }
    
    @IBAction private func didTapDone(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
