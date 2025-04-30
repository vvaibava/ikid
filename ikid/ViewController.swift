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
        // Do any additional setup after loading the view.
        jokeCreator()
        if jokeController != nil {
            self.addChild(jokeController!)
            self.view.insertSubview(<#T##view: UIView##UIView#>, belowSubview: <#T##UIView#>)
            jokeController!.didMove(toParent: <#T##UIViewController?#>)
        }
        
    }
    
    func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if let fromView = from {
            fromView.willMove(toParent: nil)
            fromView.view.removeFromSuperview()
            fromView.removeFromParent()
        }
        
        if let toView = to {
            addChild(toView)
            view.insertSubview(toView.view, at: 0)
            toView.didMove(toParent: self)
        }
    }

    @IBAction func switchViews(_ user: Any) {
        jokeCreator()
        punchCreator()
        
        let showJoke = jokeController?.view.superview != nil
        let fromView = showJoke ? jokeController : punchlineController
        let toView = showJoke ? punchlineController : jokeController
        let transition: UIView.AnimationOptions = showJoke ? .transitionFlipFromRight : .transitionFlipFromLeft

        UIView.transition(with: view, duration: 0.5, options: transition, animations: {
            fromView?.view.removeFromSuperview()
            if let toVC = toView {
                toVC.view.frame = self.view.bounds
                self.view.addSubview(toVC.view)
            }
        }, completion: nil)
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
        }
        if punchlineController != nil{
            punchlineController.punchlineLabel.text = punchline[curr]
        }
    }
    
    

}

