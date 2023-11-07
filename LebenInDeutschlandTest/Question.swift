//
//  Question.swift
//  LebenInDeutschlandTest
//
//  Created by Mehmet on 03.11.23.
//

import Foundation

struct Question{
    let text: String
    let answer : [String]
    let actualAnswer : String
    
    init(q: String, a: [String], aa: String) {
        self.text = q
        self.answer = a
        self.actualAnswer = aa
    }
}

let questions = [
    Question(q: "In Deutschland dürfen Menschen offen etwas gegen die Regierung sagen, weil...", a: ["hier Religionsfreiheit gilt.","die Menschen Steuern zahlen.","die Menschen das Wahlrecht haben.","hier Meinungsfreiheit gilt."], aa: "hier Meinungsfreiheit gilt."),
    Question(q: "In Deutschland konnen Eltern bis zum 14. Lebensjahr ihres Kindes entscheiden, ob es in der Schule am ...", a: ["Geschichtsunterricht teilnimmt.","Religionsunterricht teilnimmt.","Politikunterricht teilnimmt.", "Sprachunterricht teilnimmt."], aa: "Religionsunterricht teilnimmt."),
    Question(q: "3 + 2 = 4", a: ["correct","true","wrong","false"], aa: "correct"),
    Question(q: "4 + 4 = 9", a: ["correct","true","wrong","false"], aa: "false")


]
