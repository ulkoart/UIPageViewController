//
//  PageViewController.swift
//  UIPageView
//
//  Created by user on 27/02/2020.
//  Copyright © 2020 Artem Ulko. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenContent = [
        "Первая страница презентации, рассказывает о том, что наше представление из себя представляет",
        "Вторая страница презентации, рассказывает о том, что наше представление из себя представляет",
        "Третья страница презентации, рассказывает о том, что наше представление из себя представляет",
        "Четвертая страница презентации, рассказывает о том, что наше представление из себя представляет",
        ""
        
    ]
    
    let emojiArray = ["🤖", "🐶", "✅", "🚀", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViweController = showVeiwControllerAtIndex(0) {
            setViewControllers([contentViweController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func showVeiwControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            
            let userDefault = UserDefaults.standard
            userDefault.set(true, forKey: "presentationWasViewd")
            
            dismiss(animated: true, completion: nil)
            return nil
            
        }
        guard let contentViweController = storyboard?.instantiateViewController(withIdentifier: "ContentVireController") as? ContentViewController else { return nil }
        contentViweController.presentText = presentScreenContent[index]
        contentViweController.emoji = emojiArray[index]
        contentViweController.currentPage = index
        contentViweController.numberOfPage = presentScreenContent.count
        
        return contentViweController
    }


}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showVeiwControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showVeiwControllerAtIndex(pageNumber)
    }
    
    
}
