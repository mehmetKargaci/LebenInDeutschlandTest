//
//  ModelBrain.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 07.11.23.
//

import Foundation

struct ModelBrain {
    var questionNumber = 0
    var score = 0
    
    
    func getQuestionText() -> String {
        return questions[questionNumber].text
        
    }
    func getAnswers() -> [String] {
        return questions[questionNumber].answer
    }
    
    func getProgres() -> Float {
        let progress = Float(questionNumber) / Float(questions.count)
        return progress
        
    }
    func getScore() -> Int {
        return score
        
    }
    mutating func nextQuestion(){
        if questionNumber + 1 < questions.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
        }
    }
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionNumber].actualAnswer{
            score += 1
            return true
            
        } else{
            return false
            
        }
        
    }
}
