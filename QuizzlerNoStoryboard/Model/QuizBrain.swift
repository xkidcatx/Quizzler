//
//  QuizBrain.swift
//  QuizzlerNoStoryboard
//
//  Created by Eugene Kotovich on 11.04.2022.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], c: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], c: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], c: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], c: "Australia")
        
        //        Question(q: "A slug's blood is green.", a: "True"),
        //        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        //        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        //        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        //        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        //        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        //        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        //        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        //        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        //        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        //        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        //        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    var currentQuestion: String {
        quiz[questionNumber].text
    }
    
    func getScore() -> Int {
        return score
    }
    
    var progress: Float {
        Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
}
