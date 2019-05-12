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
    private var score: Int = 0

    // MARK: - segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showQuestion" else { return }
        if let questionViewController = (segue.destination as? UINavigationController)?.viewControllers.first as? QuestionViewController {
            questionViewController.delegate = self
        }
    }

}

// MARK: - protocol

protocol ResultDelegate: class {
    func updateScore(_ isRight: Bool)
}

extension LandingViewController: ResultDelegate {
    
    func updateScore(_ isRight: Bool) {
        if isRight {
            score += 20
            scoreLabel.text = "\(score)"
        }
    }
    
}
