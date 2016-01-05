//
//  ViewController.swift
//  NavigationManager
//
//  Created by Ross M Mooney on 1/5/16.
//  Copyright © 2016 Ross Mooney. All rights reserved.
//

import UIKit

protocol Presenter { }
extension Presenter where Self : UIViewController {
    func showAnotherViewController(type: NavigationManager.ViewControllerType) {
        NavigationManager.singleton.pushVC(type)
    }
    
    func setNewRootViewController(type: NavigationManager.ViewControllerType) {
        NavigationManager.singleton.pushVC(type, presentation: .Root)
    }
    
    func replaceViewController(type: NavigationManager.ViewControllerType) {
        NavigationManager.singleton.pushVC(type, presentation: .Replace)
    }
    
    func showModalViewController(type: NavigationManager.ViewControllerType, completionHandler: (() -> Void)?) {
        NavigationManager.singleton.pushVC(type, presentation: .Modal(completion: completionHandler))
    }
}


class RedViewController: UIViewController, Presenter {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //This is the main view controller so we can save the nav controller from here
        NavigationManager.singleton.setupWithNavigationController(self.navigationController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showBlue() {
        setNewRootViewController(.Blue)
    }
    
    @IBAction func showBlack() {
        setNewRootViewController(.Black)
    }
    
    @IBAction func showWhite() {
        setNewRootViewController(.White)
    }
}

class BlueViewController: UIViewController, Presenter {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRed() {
        showModalViewController(.Red, completionHandler: { print("Showing Red") })
    }
    
    @IBAction func showBlack() {
        showModalViewController(.Black, completionHandler: { print("Showing Black") })
    }
    
    @IBAction func showWhite() {
        showModalViewController(.White, completionHandler: { print("Showing White") })
    }
}


class BlackViewController: UIViewController, Presenter {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showBlue() {
        replaceViewController(.Blue)
    }
    
    @IBAction func showRed() {
        replaceViewController(.Red)
    }
    
    @IBAction func showWhite() {
        replaceViewController(.White)
    }
}


class WhiteViewController: UIViewController, Presenter {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showBlue() {
        showAnotherViewController(.Blue)
    }
    
    @IBAction func showBlack() {
        showAnotherViewController(.Black)
    }
    
    @IBAction func showRed() {
        showAnotherViewController(.Red)
    }
}

