//
//  ViewController.swift
//  IdeaGenerator2
//
//  Created by CCT on 5/11/19.
//  Copyright © 2019 SwiftGroup102019. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var chineseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func englishButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "selectCategory", sender: nil)
        
    }
    
    @IBAction func chineseButtoncilck(_ sender: Any) {
    }
    

}

