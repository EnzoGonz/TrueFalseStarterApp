//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit



class ViewController: UIViewController {
    
//Outlets to storyboard
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
//End of outlets

    
//To determine what code runs as the view loads- the first dispaly
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //First usage of QuizSounds
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }
// end of view did load
    
    
//For memory not relating to project
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//end of didRecieveMemory
    
    
    
//When the score is displayed the buttons should be hidden
    func displayScore() {
        // Hide the answer buttons
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        buttonThree.isHidden = true
        buttonFour.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
//end of dispalyScore
    
    
//Checking the answer-button against the answer to the question
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === buttonOne &&  correctAnswer == "Button One")
            || (sender === buttonTwo && correctAnswer == "Button Two")
            || (sender === buttonThree &&  correctAnswer == "Button Three")
            || (sender === buttonFour &&  correctAnswer == "Button Four"){
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
//End of checkAnswer
    
  
//function to generate a random numebr and use it as the index for the array of questions and displays a random question
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary["Question"]
        playAgainButton.isHidden = true
    }
//end dispalyQuestion
    
    
//function to determine if the game is over and if so to start a new game
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
//end nextRound
    
    
//When the 'Play Again' button is displayed and tapped the answer buttons reappear and the questionsAsked and correctQuestions variables are reset to 0
    @IBAction func playAgain() {
        // Show the answer buttons
        buttonOne.isHidden = false
        buttonTwo.isHidden = false
        buttonThree.isHidden = false
        buttonFour.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
//end palyAgain
    
    
    
    // MARK: Helper Methods
    

//function to delay the appearance of the next question after one is answered for 2 seconds
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
//end loadNextRoundWithDelay
    
}
//End View Controller
