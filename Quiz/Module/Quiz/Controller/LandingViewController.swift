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
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    private var score: Int = 0
    private var progress: (answered: Int, total: Int) = (0, 0)
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score) (\(progress.answered)/\(progress.total))"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playButton.setTitle(progress.total == 0 ? "Play" : "Continue", for: .normal)
    }

    // MARK: - segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showQuestion" else { return }
        if let questionViewController = (segue.destination as? UINavigationController)?.viewControllers.first as? QuestionViewController {
            questionViewController.delegate = self
            questionViewController.questionIndex = progress.total
        }
    }

}

// MARK: - protocol

protocol ResultDelegate: class {
    func updateScore(_ isRight: Bool)
}

extension LandingViewController: ResultDelegate {
    
    func updateScore(_ isRight: Bool) {
        progress.total += 1
        if isRight {
            progress.answered += 1
            score += 20
            scoreLabel.text = "\(score) (\(progress.answered)/\(progress.total))"
        }
    }
    
}
