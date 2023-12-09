//
//  Question.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 03.11.23.
//

import Foundation

struct Result: Codable {
    let data: [ResultItem]
    
}

struct ResultItem: Codable {
    let question: String
    let answers: [String]
    let hasPhoto: Bool
    let correctAnswerIndex: Int
    let theme: String
    let id: Int
    let correctAnswer: String
}



    

