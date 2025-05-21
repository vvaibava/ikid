//
//  jokeController.swift
//  ikid
//
//  Created by Vaibava Venkatesan on 5/20/25.
//

import Foundation
import UIKit

class JokeViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    var joke: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if joke != nil{
            jokeLabel.text = joke
            jokeLabel.numberOfLines = 2

        }
    }
    
}
