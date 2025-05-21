//
//  ViewController.swift
//  ikid
//
//  Created by Vaibava Venkatesan on 4/28/25.
//

import UIKit

class ViewController: UIViewController {
    private var jokeController: JokeViewController!
    private var punchlineController: PunchlineViewController!
    private var jokes: [String] = ["Why do teenage girls travel in odd numbered groups?", "What did the buffalo say to his son who was leaving for college?", "My friend David just had his ID stolen"]
    private var punchline: [String] = ["Because they just can’t even", "Bison", "We just call him Dav now"]
    private var curr: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeCreator()

        if let jokeVC = jokeController {
            self.addChild(jokeVC)
            self.view.insertSubview(jokeVC.view, at: 0)
            jokeVC.didMove(toParent: self)
        }
    }

    
    func switchViewController(from fromVC: UIViewController, to toVC: UIViewController) {
        fromVC.willMove(toParent: nil)
        fromVC.view.removeFromSuperview()
        fromVC.removeFromParent()

        self.addChild(toVC)
        self.view.addSubview(toVC.view)
        toVC.didMove(toParent: self)
    }


    @IBAction func switchViews(_ sender: Any) {
        punchCreator()
        jokeCreator()

        if jokeController != nil && jokeController.view.superview != nil {
            UIView.transition(from: jokeController.view,
                              to: punchlineController.view,
                              duration: 0.5,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
            punchlineController.view.frame = view.frame
            switchViewController(from: jokeController, to: punchlineController)
        } else {
            UIView.transition(from: punchlineController.view,
                              to: jokeController.view,
                              duration: 0.5,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
            jokeController.view.frame = view.frame
            switchViewController(from: punchlineController, to: jokeController)
        }
    }

    
    func jokeCreator(){
        if jokeController == nil {
            jokeController = storyboard?.instantiateViewController(withIdentifier: "jokeView") as? JokeViewController
            jokeController.joke = jokes[curr]
        }
    }
    
    func punchCreator(){
        if punchlineController == nil {
            punchlineController = storyboard?.instantiateViewController(withIdentifier: "PunchlineView") as? PunchlineViewController
            punchlineController.punchline = punchline[curr]
        }
    }
    
    @IBAction func goodJoke(_ user: Any){
        curr = 0
        updateJoke()
    }
    
    @IBAction func punJoke(_ user: Any){
        curr = 1
        updateJoke()
    }
    
    @IBAction func dadJoke(_ user: Any){
        curr = 2
        updateJoke()
    }
    
    func updateJoke() {
        if jokeController != nil{
            jokeController.jokeLabel.text = jokes[curr]
            jokeController.jokeLabel.numberOfLines = 2
        }
        if punchlineController != nil{
            punchlineController.punchlineLabel.text = punchline[curr]
            punchlineController.punchlineLabel.numberOfLines = 2
        }
    }
    
    

}

