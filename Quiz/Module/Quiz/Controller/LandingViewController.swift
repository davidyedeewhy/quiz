//
//  LandingViewController.swift
//  Quiz
//
//  Created by David Ye on 11/5/19.
//  Copyright © 2019 David Ye. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    // MARK: - variables
    
    private var scoreLabel: UILabel?
    private var score: Int = 0

    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }

}

// MARK: - functions

extension LandingViewController {
    
    private func configure() {
        let label = UILabel(frame: CGRect(x: 0, y: view.frame.size.height / 4.0, width: view.frame.size.width, height: 20))
        label.textAlignment = .center
        label.text = "Score"
        view.addSubview(label)
        scoreLabel = UILabel(frame: CGRect(x: 0, y: view.frame.size.height / 3.0, width: view.frame.size.width, height: 20))
        scoreLabel?.textAlignment = .center
        scoreLabel?.text = "\(score)"
        scoreLabel.map { view.addSubview($0) }
        let button = UIButton(frame: CGRect(x: 0, y: view.frame.size.height * 0.8, width: view.frame.size.width, height: 20))
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @IBAction private func didTapPlay(_ button: UIButton) {
        score = 0
        updateResult(false)
        let questionViewController = QuestionViewController()
        questionViewController.delegate = self
        present(UINavigationController(rootViewController: questionViewController), animated: true, completion: nil)
    }
    
}

protocol ResultDelegate: class {
    func updateResult(_ isRight: Bool)
}

extension LandingViewController: ResultDelegate {
    func updateResult(_ isRight: Bool) {
        if isRight {
            score += 20
            scoreLabel?.text = "\(score)"
        }
    }
}
