//
//  QuizQuestionsandMethods.swift
//  TrueFalseStarter
//
//  Created by Lorenzo Gonzalez on 15/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


import GameKit




//struct for questions
struct Question{
    
    let question: String
    let answer: String
    
}
//end struct for questions


//Instances of struct Questions
let firstQuestion = Question(question: "The answer is Button One", answer: "Button One")
let secondQuestion = Question(question: "The answer is Button Two", answer: "Button Two")
let thirdQuestion = Question(question: "The answer is Button Three", answer: "Button Three")
let fourthQuestion = Question(question: "The answer is Button Four", answer: "Button Four")
//end of question instances

//collection of Question Instances
let allQuestions:[Question] = [firstQuestion, secondQuestion, thirdQuestion, fourthQuestion]
//end of Question collection























