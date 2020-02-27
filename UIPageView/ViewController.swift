//
//  ViewController.swift
//  UIPageView
//
//  Created by user on 27/02/2020.
//  Copyright © 2020 Artem Ulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
    }

    func startPresentation() {
        
        let userDefaults = UserDefaults.standard
        
        let presentationWasVied = userDefaults.bool(forKey: "presentationWasViewd")
        if presentationWasVied == false {
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController") as? PageViewController {
                present(pageViewController, animated: true, completion: nil)
            }
        }
        

    }
    
}

