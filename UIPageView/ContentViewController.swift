//
//  ContentViewController.swift
//  UIPageView
//
//  Created by user on 27/02/2020.
//  Copyright © 2020 Artem Ulko. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0 // номер текущей страницы
    var numberOfPage = 0 // количество страниц
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPage
        pageControl.currentPage = currentPage
        
    }


}
