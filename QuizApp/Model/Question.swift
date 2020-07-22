//
//  Question.swift
//  QuizApp
//
//  Created by Ian Fuelberth on 7/20/20.
//  Copyright © 2020 HousingInsecurity. All rights reserved.
//

import Foundation

class Question{
    var question: String = ""
    var answer: String = ""
    var a: String = ""
    var b: String = ""
    var c: String = ""
    var d: String = ""
    
    init(question: String, answer: String, a: String, b: String, c: String, d: String)
    {
        self.question = question
        self.answer = answer
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
}
