//
//  Question.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 03.11.23.
//

import Foundation


struct Question: Codable {
    let question: String
    let answers: [String]
    let hasPhoto: Bool
    let correctAnswerIndex: Int
    let theme: String
    let id: Int
    let correctAnswer: String
}

struct AllQuestion: Codable {
    let questions: [Question]
}

    
//let questions = [
//    Question(q: "In Deutschland dürfen Menschen offen etwas gegen die Regierung sagen, weil...", a: ["hier Religionsfreiheit gilt.","die Menschen Steuern zahlen.","die Menschen das Wahlrecht haben.","hier Meinungsfreiheit gilt."], aa: "hier Meinungsfreiheit gilt."),
//    Question(q: "In Deutschland konnen Eltern bis zum 14. Lebensjahr ihres Kindes entscheiden, ob es in der Schule am ...", a: ["Geschichtsunterricht teilnimmt.","Religionsunterricht teilnimmt.","Politikunterricht teilnimmt.", "Sprachunterricht teilnimmt."], aa: "Religionsunterricht teilnimmt."),
//    Question(q: "3 + 2 = 4", a: ["correct","true","wrong","false"], aa: "correct"),
//    Question(q: "4 + 4 = 9", a: ["correct","true","wrong","false"], aa: "false")
//
//
//]
