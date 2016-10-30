//
//  ViewController.swift
//  Hangman
//
//  Created by Frederic Murry on 10/29/16.
//  Copyright © 2016 Frederic Murry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dictionary : [Int: String] = [0: "Hello", 1: "World", 2: "Developer", 3: "Software", 4: "Apple", 5: "Mobile"]
    let TAG : String = "ViewController:"
    
    var lives : Int = 10
    
    @IBOutlet weak var livesLabel : UILabel!
    @IBOutlet weak var wordLabel : UILabel!
    @IBOutlet weak var userInput : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let randomNumber : Int = Int(arc4random_uniform(5))
        var word : String! = dictionary[randomNumber]
        print(TAG + " Word is:" + word)
        var i = word.characters.count
        var newLabel : String = ""
        while i > 0 {
            newLabel = newLabel+"*"
            i-=1
        }
        wordLabel.text = newLabel
        initializeGame(word: word)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
        Initializes the Game
        @param word The word for the game
    */
    func initializeGame(word : String) {
        var livesToString : String = "Lives: "
        var i = lives
        while i > 0 {
            livesToString = livesToString + "*"
            i-=1
        }
        let length : Int = word.characters.count
        print(TAG + " Length is: ", length)
        print(TAG + " Lives are: " + livesToString)
        livesLabel.text = livesToString
        print(TAG, "Done initializing game.....")
        
    }

}

