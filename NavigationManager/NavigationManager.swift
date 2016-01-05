//
//  NavigationManager.swift
//  NavigationManager
//
//  Created by Ross M Mooney on 1/5/16.
//  Copyright © 2016 Ross Mooney. All rights reserved.
//

import UIKit



class NavigationManager {
    static let singleton = NavigationManager()
    
    var navigationController:UINavigationController!
    var currentPresentation:Presentation = .Root
    
    enum ViewControllerId : String {
        case Red = "RedViewController"
        case Blue = "BlueViewController"
        case Black = "BlackViewController"
        case White = "WhiteViewController"
    }
    
    enum Presentation {
        case Root
        case Replace
        case Push
        case Modal(completion: (() -> Void)?)
    }
    
    init() {
        
    }
    
    func setupWithNavigationController(navigationController: UINavigationController?) {
        if let nav = navigationController where self.navigationController == nil {
            self.navigationController = nav
        }
    }
    
    func pushVC(vc: ViewControllerId, presentation:Presentation = .Push) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(vc.rawValue)

        if case .Modal(_) = self.currentPresentation {
            //Clear modal if we are presenting one
            self.navigationController.dismissViewControllerAnimated(true, completion: { self.presentVC(viewController, presentation: presentation) })
        } else {
            self.presentVC(viewController, presentation: presentation)
        }
    }
    
    private func presentVC(viewController: UIViewController, presentation: Presentation) {
        switch presentation {
        case .Push:
            self.navigationController.pushViewController(viewController, animated: true)
        case .Root:
            self.navigationController.setViewControllers([viewController], animated: true)
        case .Modal(let completion):
            self.navigationController.presentViewController(viewController, animated: true, completion: completion)
        case .Replace:
            var viewControllers = Array(self.navigationController.viewControllers.dropLast())
            viewControllers.append(viewController)
            self.navigationController.setViewControllers(viewControllers, animated: true)
        }
        self.currentPresentation = presentation
    }
    
}