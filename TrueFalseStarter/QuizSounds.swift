//
//  QuizSoundsandMethods.swift
//  TrueFalseStarter
//
//  Created by Lorenzo Gonzalez on 15/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


import AudioToolbox
import GameKit


//variable to store the identifier for the inital game sound
var gameSound: SystemSoundID = 0


func loadGameSounds(soundName: String, soundType: String){
    let pathToSoundFile = Bundle.main.path(forResource: soundName, ofType: soundType)
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
}//end loadGameSOunds


//function to play the game start soudn at startup
func playGameSound() {
    AudioServicesPlaySystemSound(gameSound)
}//end playGameStartSound


//To generate a random either correct or incorrect answer sound
//variables to store strign names of sound files
let correctAnswerSoundNames = ["wubba", "oh_yeahh", "my_man", "I_like_what_you_got"]
let incorrectAnswerSoundNames = ["Riggity", "oh_man", "hey_ya_you_doing_ok_"]

//func to genreate random number and assign as index to either of sound file variable arrays
func randomSounds(forAnswerIs: String) -> String{
    switch forAnswerIs {
    case "Correct":
        let randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: correctAnswerSoundNames.count)
        return correctAnswerSoundNames[randomIndex]
    case "Incorrect":
        let randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: incorrectAnswerSoundNames.count)
        return incorrectAnswerSoundNames[randomIndex]
    default: return "ShowMe"
        
    }//end switch
}//end func
