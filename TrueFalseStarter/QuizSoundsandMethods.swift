//
//  QuizSoundsandMethods.swift
//  TrueFalseStarter
//
//  Created by Lorenzo Gonzalez on 15/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


import AudioToolbox


//variable to store the identifier for the inital game sound
var gameSound: SystemSoundID = 0

//function that loads teh game sound at app start up
func loadGameStartSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
}
//end loadGameStartSound


//function to play the game start soudn at startup
func playGameStartSound() {
    AudioServicesPlaySystemSound(gameSound)
}
//end playGameStartSound

