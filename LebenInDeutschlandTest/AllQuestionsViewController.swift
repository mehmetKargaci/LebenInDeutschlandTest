//
//  ViewController.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 02.11.23.
//

import UIKit

class AllQuestionsViewController: UIViewController {
    
    var result: Result?
    var questionNumber = 0
    var score = 0

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionStates: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //a,b,c,d
        let userGotItRight = checkAnswer(userAnswer: userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    private  func parseJSON(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            
            if result != nil {
                
            } else {
                print("fail to pase")
            }
            return
            
        }
        catch {
            print("Error: \(error)")
        }
    }
    func getQuestionText() -> String? {
        
        let questionText = result?.data[questionNumber].question
        return questionText
    }
    
    func getAnswers() -> [String]? {
        let answers = result?.data[questionNumber].answers
        return answers
    }
    
    func nextQuestion(){
        if questionNumber + 1 < 460 {
            questionNumber += 1
//            imageView.image = nil
            
        } else {
            questionNumber = 0
        }
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == result?.data[questionNumber].correctAnswer {
            score += 1
            return true
            
        } else{
            return false
            
        }
        
    }
    func getProgress() -> Float {
        return Float(questionNumber) / Float((result?.data.count)!)
    }
    
    func getScore() -> Int {
        return score
    }
    func getStates() -> String {
        let id = result?.data[questionNumber].id
        let states = "\(String(describing: id!)) / \(String(describing: result!.data.count))"
        
        return states
    }
    
    func getImage() {
        let hasImage = result!.data[questionNumber].hasPhoto
        let imageID = result!.data[questionNumber].id

        if hasImage {
            imageView.image = UIImage(named: "\(String(describing: imageID))")
            
        } else {
            imageView.image = nil
        }
        
    }
    

    @objc func updateUI() {
        
        parseJSON()
        questionLabel.text = result!.data[questionNumber].question
                
        
        getImage()
        
        
        
        let answerChoices = getAnswers()
        answerA.setTitle(answerChoices![0], for: .normal)
        answerB.setTitle(answerChoices![1], for: .normal)
        answerC.setTitle(answerChoices![2], for: .normal)
        answerD.setTitle(answerChoices![3], for: .normal)

        answerA.backgroundColor = UIColor.clear
        answerB.backgroundColor = UIColor.clear
        answerC.backgroundColor = UIColor.clear
        answerD.backgroundColor = UIColor.clear
        
        
        progressBar.progress = getProgress()
        scoreLabel.text = "Score: \(getScore())"
        questionStates.text = getStates()


    }
}
