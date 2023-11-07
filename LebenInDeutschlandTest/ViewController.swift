//
//  ViewController.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 02.11.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    var modelBrain = ModelBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //a,b,c,d
        let userGotItRight = modelBrain.checkAnswer(userAnswer)

        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        modelBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = modelBrain.getQuestionText()
        
        let answerChoices = modelBrain.getAnswers()
        answerA.setTitle(answerChoices[0], for: .normal)
        answerB.setTitle(answerChoices[1], for: .normal)
        answerC.setTitle(answerChoices[2], for: .normal)
        answerD.setTitle(answerChoices[3], for: .normal)
        
        answerA.backgroundColor = UIColor.clear
        answerB.backgroundColor = UIColor.clear
        answerC.backgroundColor = UIColor.clear
        answerD.backgroundColor = UIColor.clear
        
        progressBar.progress = modelBrain.getProgres()
        scoreLabel.text = "Score: \(modelBrain.getScore())"
        
        
    }
    
}

