//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by lapacino on 8/5/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var winningResultLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var button0: UIButton!
    var goNumber = 1
    
    // 0 empty 1 nought 2 cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningPossibility = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var winner = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: UIButton) {
     
        if gameState[sender.tag] == 0 && winner == 0 {
            var image = UIImage()
            if goNumber % 2 == 0 {
                
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 2
            }
            else {
                image = UIImage(named: "nought.png")!
                gameState[sender.tag] = 1
            }
            
            
            for possibility in winningPossibility {
                
                if gameState[possibility[0]] == gameState[possibility[1]] && gameState[possibility[0]] == gameState[possibility [2]] && gameState[possibility[0]] != 0 {
                    
                    winner = gameState[possibility[0]]
                    if winner == 1 {
                        winningResultLabel.hidden = false
                        playAgain.hidden = false
                        winningResultLabel.text = "nought won"
                    }
                    else {
                        winningResultLabel.hidden = false
                        playAgain.hidden = false
                        winningResultLabel.text = "cross won"
                    }
                    
                }
            }
            sender.setImage(image, forState: .Normal)
            goNumber++
        }
     

    }
    
    @IBAction func playAgainButton(sender: UIButton) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winner = 0
        winningResultLabel.hidden = true
        playAgain.hidden = true 
        var button:UIButton
        
        for var i = 0; i < 9; i++ {
            
           button = self.view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        
    }
 }

