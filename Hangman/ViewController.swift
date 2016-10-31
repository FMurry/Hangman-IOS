//
//  ViewController.swift
//  Hangman
//
//  Created by Frederic Murry on 10/29/16.
//  Copyright © 2016 Frederic Murry. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let dictionary : [Int: String] = [0: "Hello", 1: "World", 2: "Developer", 3: "Software", 4: "Apple", 5: "Mobile", 6: "Dog", 7: "Cat"]
    let TAG : String = "ViewController:"
    let alphabet : [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var lives : Int = 7
    var word : String!
    var points : Int = 0
    
    @IBOutlet weak var livesLabel : UILabel!
    @IBOutlet weak var hintLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeWord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initializeWord() {
        print(TAG,dictionary.count-1)
        let randomNumber : Int = Int(arc4random_uniform(UInt32(dictionary.count)))
        word = dictionary[randomNumber]
        print(TAG + " Word is:" + word)
        var i = word.characters.count
        var newLabel : String = ""
        while i > 0 {
            newLabel = newLabel+"_ "
            i-=1
        }
        hintLabel.text = newLabel
        initializeGame(word: word)

    }
    
    /**
        Initializes the Game
        @param word The word for the game
    */
    func initializeGame(word : String) {
        var livesToString : String = "Lives: "
        var i = lives
        while i > 0 {
            livesToString = livesToString + "❤︎"
            i-=1
        }
        print(TAG + " Lives are: " + livesToString)
        livesLabel.text = livesToString
        print(TAG, "Done initializing game.....")
        
    }
    
    @IBAction func game(sender : AnyObject) {
        let button : UIButton = sender as! UIButton
        button.isEnabled = false
        let c = alphabet[button.tag]
        var i = 0
        let characters = Array(word.characters)
        var found : Bool = false
        
        for character in characters {
            if c == String(character).lowercased() {
                points += 1
                found = true
                if i == 0{
                    var label = [Character](hintLabel.text!.characters)
                    label[0] = Character(c)
                    let newLabel = String(label)
                    hintLabel.text = newLabel
                    
                }
                else{
                    var label = [Character](hintLabel.text!.characters)
                    label[i*2] = Character(c)
                    let newLabel = String(label)
                    hintLabel.text = newLabel
                }
            }
            i+=1
        }
        if !found {
            lives-=1
            setHearts()
            
        }
        if points == word.characters.count {
            //Winning state
            print(TAG+" You Win!!!")
            let alertController = UIAlertController(title: "You Win", message: " You beat the game! Play again?", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style:
                UIAlertActionStyle.default, handler: {action in self.restartGame()}))
            self.present(alertController, animated: true, completion:
                nil)
        }
    }
    
    func setHearts() {
        var livesToString : String = "Lives: "
        var i = lives
        while i > 0 {
            livesToString = livesToString + "❤︎"
            i-=1
        }
        print(TAG + " Lives are: " + livesToString)
        livesLabel.text = livesToString
        if lives == 0 {
            //Losing state
            print(TAG+" You Lose!!!")
            let alertController = UIAlertController(title: "You Lose", message: "Try again?", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Restart", style:
                UIAlertActionStyle.destructive, handler: {action in self.restartGame()}))
            self.present(alertController, animated: true, completion:
                nil)
        }
    }
    
    func restartGame() {
        print(TAG+" Restart Called")
        loadView()
        lives = 7
        points = 0
        initializeWord()
       
    }
    
    @IBAction func restartGamefromAction() {
        print(TAG+" Restart Called")
        loadView()
        lives = 7
        points = 0
        initializeWord()
    }
}

