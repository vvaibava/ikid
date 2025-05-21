//
//  PunchlineViewController.swift
//  ikid
//
//  Created by Vaibava Venkatesan on 5/20/25.
//

import Foundation
import UIKit

class PunchlineViewController: UIViewController {
    
    @IBOutlet weak var punchlineLabel: UILabel!
    var punchline: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if punchline != nil {
            punchlineLabel.text = punchline!
        }
    }
    
    func updateLabel() {
        if punchline != nil && punchlineLabel != nil {
            punchlineLabel.text = punchline!
            punchlineLabel.numberOfLines = 2
        }
    }
}
