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
    let TAG : String = "ViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let randomNumber : Int = Int(arc4random_uniform(5))
        var word : String! = dictionary[randomNumber]
        print(TAG + " Word is:" + word)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func game(word : String) {
        //Something Here 
    }

}

