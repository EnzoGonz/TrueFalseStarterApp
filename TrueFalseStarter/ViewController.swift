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
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var countdownTimer: UILabel!
//End of outlets

    
//To determine what code runs as the view loads- the first dispaly
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        buttonThree.isHidden = true
        buttonFour.isHidden = true
        nextQuestionButton.isHidden = true
        
        countdownTimer.isHidden = true
        
        playAgainButton.setTitle("START QUIZ", for: UIControlState.normal)
        
        
        
    }// end of view did load
    
    
    //For memory not relating to project
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //end of didRecieveMemory
    
    
    
/*
--------------------------------------------------------------------------------------------------------------
                        **********    Start Game Section    *********
--------------------------------------------------------------------------------------------------------------
*/
    

   /* @IBAction func playAgainStartGame(_ sender: UIButton) {
        
        loadGameSounds(soundName: "ShowMe", soundType: "wav")
        playGameSound()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.runTimer), userInfo: nil, repeats: true)
        
        displayQuestion()
        
    }//end start game/play again button
    */

    

/*
--------------------------------------------------------------------------------------------------------------
                                    **********    Display Question Section    *********
--------------------------------------------------------------------------------------------------------------
*/
    
    
    
    
    // Generatign a random number to use as the index of allQuestions - for random question to display. Also verifyign that the question has not been displayed before, and if it has generating a new random number

    

//vars and constants to hold interation numbers for questions asked/correctly answered
    let questionsPerRound = allQuestions.count
    var questionsAsked = 0
    var correctQuestions = 0
    var previouslyUsedNumbers: [Int] = [-1]
    var indexOfSelectedQuestion = 0
//end vars and lets

    
    func displayQuestion() {
        
        
        
        buttonOne.isHidden = false
        buttonTwo.isHidden = false
        buttonThree.isHidden = false
        buttonFour.isHidden = false
        
        
       
        
        buttonOne.isEnabled = true
        buttonTwo.isEnabled = true
        buttonThree.isEnabled = true
        buttonFour.isEnabled = true
        
        if questionsAsked != (questionsPerRound - 1) {
            nextQuestionButton.setTitle("NEXT QUESTION", for: UIControlState.normal)
        } else { nextQuestionButton.setTitle("VIEW SCORE", for: UIControlState.normal)
        }//end if statement
        nextQuestionButton.isHidden = true
        
        var shouldDisplayQuestion = false
    
        while shouldDisplayQuestion == false{
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: allQuestions.count)
    
    /////////////////////////////////////////////////////////
            func thisNumberHasBeenUsed() -> Bool{
                for previousNumber in previouslyUsedNumbers{
                    if previousNumber == indexOfSelectedQuestion{
                        return true
                    }//if statement end
                }//for loop end
                return false
            }//func end
    /////////////////////////////////////////////////////////
    
            if thisNumberHasBeenUsed() == false {
                previouslyUsedNumbers.append(indexOfSelectedQuestion)
                let questionToDisplay = allQuestions[indexOfSelectedQuestion]
                questionField.text = questionToDisplay.question
                
                buttonOne.setTitle(questionToDisplay.answer1, for: UIControlState.normal)
                buttonTwo.setTitle(questionToDisplay.answer2, for: UIControlState.normal)
                buttonThree.setTitle(questionToDisplay.answer3, for: UIControlState.normal)
                buttonFour.setTitle(questionToDisplay.answer4, for: UIControlState.normal)
                
                
                nextQuestionButton.isHidden = true
                playAgainButton.isHidden = true
                shouldDisplayQuestion = true
            }//if thisNumebrHasBeenUSed end
            
        }//while shouldDisplayQuestion loop end
        
        shouldDisplayQuestion = false
    }//func displayQuestion end
    
    
/*
--------------------------------------------------------------------------------------------------------------
                                **********    Check Answer Section    *********
--------------------------------------------------------------------------------------------------------------
*/
    
    
//Checking the answer-button against the answer to the question to determine if correct or incorrect
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        
        
        // Increment the questions asked counter
        questionsAsked += 1
        
        timer.invalidate()
        
        let selectedQuestionDict = allQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.correctAnswer
        
        //if correct then
        if (sender === buttonOne &&  correctAnswer == selectedQuestionDict.answer1)
            || (sender === buttonTwo && correctAnswer == selectedQuestionDict.answer2)
            || (sender === buttonThree &&  correctAnswer == selectedQuestionDict.answer3)
            || (sender === buttonFour &&  correctAnswer == selectedQuestionDict.answer4){
            correctQuestions += 1
            
            //correct answer prompts a random correctAnswer sound to play
            loadGameSounds(soundName: randomSounds(forAnswerIs: "Correct"), soundType: "wav")
            playGameSound()
            
            countdownTimer.isHidden = true
    
            questionField.text = "Correct!"
            
            buttonOne.isEnabled = false
            buttonTwo.isEnabled = false
            buttonThree.isEnabled = false
            buttonFour.isEnabled = false

            nextQuestionButton.isHidden = false
            
        } else {//if incorrect then
            
            //incorrect answer prompts a random incorrect answer to play
            loadGameSounds(soundName: randomSounds(forAnswerIs: "Incorrect"), soundType: "wav")
            playGameSound()
            
            countdownTimer.isHidden = true
            
            questionField.text = "Sorry, wrong answer! The correct answer was \(selectedQuestionDict.correctAnswer)"
            
            buttonOne.isEnabled = false
            buttonTwo.isEnabled = false
            buttonThree.isEnabled = false
            buttonFour.isEnabled = false
            
            nextQuestionButton.isHidden = false
            
        }//end if sender === statement
        
        
    }//End of checkAnswer func
  
    
/*
--------------------------------------------------------------------------------------------------------------
                                **********    Next Round Section    *********
--------------------------------------------------------------------------------------------------------------
*/
    
    
    
    
//function to determine if the game is over and if so to start a new game
    func nextRound() {
        
        countdownTimer.text = "15"
        countdownTimer.isHidden = false
        
        
        if questionsAsked == questionsPerRound {
            time = 14
            // Game is over
            countdownTimer.isHidden = true
            timer.invalidate()
            playAgainButton.setTitle("PLAY AGAIN", for: UIControlState.normal)
            
            displayScore()
            
        } else {
            // Continue game
            time = 14
            displayQuestion()
        }
    }//end nextRound func
    
    
    
    
    
/*
--------------------------------------------------------------------------------------------------------------
                                **********    Timer / Next Question Section  *********
--------------------------------------------------------------------------------------------------------------
*/
    
    
    
    var time = 14//Hard number used for lightning round time available - 15 seconds
    var timer = Timer()

//function called when the timer runs
    func runTimer(){
        if time > 5 {
            countdownTimer.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            countdownTimer.text = "\(time)"
            time -= 1
        } else if ((time <= 5) && (time != 0)){
            countdownTimer.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            countdownTimer.text = "\(time)"
            time -= 1
        } else if time == 0 {
            
            questionsAsked += 1
            
            timer.invalidate()
            
            
            
            loadGameSounds(soundName: randomSounds(forAnswerIs: "Incorrect"), soundType: "wav")
            playGameSound()
                
            questionField.text = "You ran out of time!"
                
            countdownTimer.text = "BUMMER!"
                
            buttonOne.isEnabled = false
            buttonTwo.isEnabled = false
            buttonThree.isEnabled = false
            buttonFour.isEnabled = false
                
            nextQuestionButton.isHidden = false
                
            
        }
    }//end runTimer func
    
    
    
    
    
    
//nextQuestionButton is tapped to proceed to the next question
    @IBAction func nextQuestionAction(_ sender: UIButton) {
        countdownTimer.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.runTimer), userInfo: nil, repeats: true)
        nextRound()
        
    }//end button func
    
 
    
/*
--------------------------------------------------------------------------------------------------------------
                                **********   Display Score Section    *********
--------------------------------------------------------------------------------------------------------------
*/
    
    
    
//When the score is displayed the buttons should be hidden
    func displayScore() {
        // Hide the answer buttons
        buttonOne.isHidden = true
        buttonTwo.isHidden = true
        buttonThree.isHidden = true
        buttonFour.isHidden = true
        nextQuestionButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        if Double(correctQuestions) >= (Double(questionsPerRound) * 0.7){
            questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        } else {
            questionField.text = "Too Bad!\nYou only got \(correctQuestions) out of \(questionsPerRound) correct.\nBetter Luck Next Time!"
        }//end of if statement
    }//end of displayScore
    
    
    
/*
--------------------------------------------------------------------------------------------------------------
                                    **********    Play Again Section    *********
--------------------------------------------------------------------------------------------------------------
*/
    
    
//When the 'Play Again' button is displayed and tapped the answer buttons reappear and the questionsAsked and correctQuestions variables are reset to 0
@IBAction func playAgain() {
    
        loadGameSounds(soundName: "ShowMe", soundType: "wav")
        playGameSound()
    
        // Show the answer buttons
        buttonOne.isHidden = false
        buttonTwo.isHidden = false
        buttonThree.isHidden = false
        buttonFour.isHidden = false
        nextQuestionButton.isHidden = true
        
        questionsAsked = 0
        correctQuestions = 0
        previouslyUsedNumbers = [-1]
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.runTimer), userInfo: nil, repeats: true)
    
        nextRound()
    }
//end playAgain
    
}//End View Controller
