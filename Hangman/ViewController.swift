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
    
    let dictionary : [Int: String] = [0: "Hello", 1: "World", 2: "Developer", 3: "Software", 4: "Apple", 5: "Mobile"]
    let TAG : String = "ViewController:"
    let alphabet : [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var lives : Int = 10
    var word : String!
    
    @IBOutlet weak var livesLabel : UILabel!
    @IBOutlet weak var hintLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let randomNumber : Int = Int(arc4random_uniform(5))
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
            livesToString = livesToString + "❤︎"
            i-=1
        }
        let length : Int = word.characters.count
        print(TAG + " Length is: ", length)
        print(TAG + " Lives are: " + livesToString)
        livesLabel.text = livesToString
        print(TAG, "Done initializing game.....")
        
    }
    
    @IBAction func game(sender : AnyObject) {
        let button : UIButton = sender as! UIButton
        let c = alphabet[button.tag]
        print(TAG+c)
        var i = 0
        let characters = Array(word.characters)
        print(TAG+"Characters:",characters)
        var found : Bool = false
        
        for character in characters {
            print(TAG+"char:",character)
            if c == String(character).lowercased() {
               found = true
               print(TAG+"Match")
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
    }

}

