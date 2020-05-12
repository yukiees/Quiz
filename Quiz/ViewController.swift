//
//  ViewController.swift
//  Quiz
//
//  Created by 松島優希 on 2020/05/12.
//  Copyright © 2020 松島優希. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toQuiz() {
        performSegue(withIdentifier: "quiz", sender: nil)
    }
    
}

