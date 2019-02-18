//
//  ViewController.swift
//  Dice Game1
//
//  Created by Seran Sathivel on 2018-11-27.
//  Copyright © 2018 Seran Sathivel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDice: UIImageView!
    
    @IBOutlet weak var rigthDice: UIImageView!
    
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var userDiceNumber: UILabel!
    
    @IBOutlet weak var CPUScore: UILabel!
    
    @IBOutlet weak var CPUDiceNumber: UILabel!
    
    @IBOutlet weak var userWins: UILabel!
    
    @IBOutlet weak var cpuWins: UILabel!
    
    @IBOutlet weak var userloses: UILabel!
    
    @IBOutlet weak var cpuLoses: UILabel!
    
    @IBOutlet weak var userTies: UILabel!
    
    @IBOutlet weak var cpuTies: UILabel!
    
    @IBOutlet weak var winnerOrLoser: UILabel!
    
    @IBOutlet weak var rollAgainMessage: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    //delcalre variables to hold user and cpu total scorers
    var userTotalScore = 0
    var cpuTotalScore = 0
    
    //declare variables to hold user and cpu Score board results
    var userTotalWins = 0
    var cpuTotalWins = 0
    var userTotalLoses = 0
    var cpuTotalLoses = 0
    var bothTotalTies = 0
    
    
    @IBAction func rollTap(_ sender: Any) {
     
        //generate random numbers for dice
        let userDiceRandNum = arc4random_uniform(6) + 1
        let cpuDiceRandNum = arc4random_uniform(6) + 1
        
        //display to user and cpu what they rolled
        userDiceNumber.text = String(userDiceRandNum)
        CPUDiceNumber.text = String(cpuDiceRandNum)

        //display updated dice picture for user
        leftDice.image = UIImage(named: "dice\(userDiceRandNum)")
        //display updated dice picture for CPU
        rigthDice.image = UIImage(named: "dice\(cpuDiceRandNum)")
        
        //add the dice number to the total score for user and cpu
        userTotalScore += Int(userDiceRandNum)
        cpuTotalScore += Int(cpuDiceRandNum)
        
        //display to the user the total scores
        playerScore.text = String(userTotalScore)
        CPUScore.text = String(cpuTotalScore)
        
        //reset text on screen to no show
        winnerOrLoser.text = String("")
        
        
        
        //create decison to see if BOTH user AND cpu reached 24 score or higher
        if userTotalScore >= 24 && cpuTotalScore >= 24 {
            //add one to the score board for ties
            bothTotalTies += 1
            //print this result on scoreboards
            cpuTies.text = String(bothTotalTies)
            userTies.text = String(bothTotalTies)
            
            //output to winner if they won, lost or tied
            winnerOrLoser.text = String("You and iPhone TIED!")
           
            
            //reset values
            userTotalScore = 0
            cpuTotalScore = 0
            
        }
        //create decsion if user gets above 24 point first
        else if userTotalScore >= 24 {
            //update score board
            userTotalWins += 1
            cpuTotalLoses += 1
            //print the new socre board results to the user
            cpuLoses.text = String(cpuTotalLoses)
            userWins.text = String(userTotalWins)
            
            //output to winner if they won, lost or tied
            winnerOrLoser.text = String("You WON!")
            
            
            //reset values
            userTotalScore = 0
            cpuTotalScore = 0
        }
        //create decison if cpu gets over 12 points before user
        else if cpuTotalScore >= 24 {
            //update the score board
            userTotalLoses += 1
            cpuTotalWins += 1
            //print the scoreboard resutls to the user
            cpuWins.text = String(cpuTotalWins)
            userloses.text = String(userTotalLoses)
            
            //output to winner if they won, lost or tied
            winnerOrLoser.text = String("You LOST!")
            
            
            //reset values
            userTotalScore = 0
            cpuTotalScore = 0
            
        }
    }
   
    @IBAction func resetButton(_ sender: Any) {
        //initalize varriables to zero
        userTotalScore = 0
        cpuTotalScore = 0
        userTotalWins = 0
        cpuTotalWins = 0
        userTotalLoses = 0
        cpuTotalLoses = 0
        bothTotalTies = 0
        
        //display reset values to user
        winnerOrLoser.text = String("")
        cpuWins.text = String(cpuTotalWins)
        userloses.text = String(userTotalLoses)
        cpuLoses.text = String(userTotalWins)
        cpuTies.text = String(cpuTotalWins)
        userWins.text = String(cpuTotalWins)
        userTies.text = String(userTotalWins)
        CPUScore.text = String(userTotalWins)
        playerScore.text = String(userTotalWins)
        userDiceNumber.text = String(userTotalWins)
        CPUDiceNumber.text = String(userTotalWins)
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

