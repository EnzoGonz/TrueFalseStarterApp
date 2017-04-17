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
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let correctAnswer: String
    
}
//end struct for questions


//Instances of struct Questions
let firstQuestion = Question(question: "This was the only US President to serve more than two consecutive terms.", answer1: "George Washington", answer2: "Franklin D. Roosevelt", answer3: "Woodrow Wilson", answer4: "Andrew Jackson", correctAnswer: "Franklin D. Roosevelt")

let secondQuestion = Question(question: "Which of the following countries has the most residents?", answer1: "Nigeria", answer2: "Russia", answer3: "Iran", answer4: "Vietnam", correctAnswer: "Nigeria")

let thirdQuestion = Question(question: "In what year was the United Nations founded?", answer1: "1918", answer2: "1919", answer3: "1945", answer4: "1954", correctAnswer: "1945")

let fourthQuestion = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", answer1: "Paris", answer2: "Washington D.C.", answer3: "New York City", answer4: "Boston", correctAnswer: "New York City")

let fifthQuestion = Question(question: "Which nation produces the most oil?", answer1: "Iran", answer2: "Iraq", answer3: "Brazil", answer4: "Canada", correctAnswer: "Canada")

let sixthQuestion = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", answer1: "Italy", answer2: "Brazil", answer3: "Argetina", answer4: "Spain", correctAnswer: "Brazil")

let seventhQuestion = Question(question: "Which of the following rivers is longest?", answer1: "Yangtze", answer2: "Mississippi", answer3: "Congo", answer4: "Mekong", correctAnswer: "Mississippi")

let eighthQuestion = Question(question: "Which city is the oldest?", answer1: "Mexico City", answer2: "Cape Town", answer3: "San Juan", answer4: "Sydney", correctAnswer: "Mexico City")

let ninthQuestion = Question(question: "Which country was the first to allow women to vote in national elections?", answer1: "Poland", answer2: "United States", answer3: "Sweden", answer4: "Senegal", correctAnswer: "Poland")

let tenthQuestion = Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", answer1: "France", answer2: "Germany", answer3: "Japan", answer4: "Great Britian", correctAnswer: "Great Britian")
//end of question instances

//collection of Question Instances
let allQuestions:[Question] = [firstQuestion, secondQuestion, thirdQuestion, fourthQuestion, fifthQuestion, sixthQuestion, seventhQuestion, eighthQuestion, ninthQuestion, tenthQuestion]
//end of Question collection























