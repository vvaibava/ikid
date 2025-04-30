//
//  JokeController.swift
//  ikid
//
//  Created by Vaibava Venkatesan on 4/28/25.
//

import UIKit

class JokeViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    var joke: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if joke != nil{
            jokeLabel.text = joke
        }
    }
    
}
