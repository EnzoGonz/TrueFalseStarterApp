//
//  QuizQuestionsandMethods.swift
//  TrueFalseStarter
//
//  Created by Lorenzo Gonzalez on 15/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


import GameKit

//vars and constants to hold interation numbers for questions asked/correctly answered
let questionsPerRound = 4
var questionsAsked = 0
var correctQuestions = 0
var indexOfSelectedQuestion: Int = 0
//end vars and lets


//struct for questions
let trivia: [[String : String]] = [
    ["Question": "The answer is Button One", "Answer": "Button One"],
    ["Question": "The answer is Button Two", "Answer": "Button Two"],
    ["Question": "The answer is Button Three", "Answer": "Button Three"],
    ["Question": "The answer is Button Four", "Answer": "Button Four"]
]
//end struct for questions

//Instances of struct Questions


