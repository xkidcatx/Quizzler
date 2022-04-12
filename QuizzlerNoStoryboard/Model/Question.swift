//
//  Question.swift
//  QuizzlerNoStoryboard
//
//  Created by Eugene Kotovich on 12.04.2022.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        text = q
        answer = a
        correctAnswer = c
    }
}
