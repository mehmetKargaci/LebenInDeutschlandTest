//
//  ModelBrain.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 07.11.23.
//

import Foundation
import UIKit

struct ModelBrain {
    var questionNumber = 0
    var score = 0
    var questionsList: Question?
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> AllQuestion? {
        do {
            let decodedData = try JSONDecoder().decode(AllQuestion.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    
    
    func getQuestionText() -> String {
        return questionsList?.question ?? "no value"
        
    }
////    func getAnswers() -> [String] {
////        return questionsList?.answers ?? "no answer"
////    }
//    
////    func getProgres() -> Float {
////        let progress = Float(questionNumber) / Float((questionsList?.question.count)!)
////        return progress
////        
////    }
//    func getScore() -> Int {
//        return score
//        
//    }
    mutating func nextQuestion(){
        if questionNumber + 1 < (questionsList?.question.count)! {
            questionNumber += 1
            
        } else {
            questionNumber = 0
        }
    }
//    mutating func checkAnswer(_ userAnswer: String) -> Bool {
//        if userAnswer == questionsList?.correctAnswer{
//            score += 1
//            return true
//            
//        } else{
//            return false
//            
//        }
//        
//    }
}
