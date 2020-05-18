//
//  ViewController.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 18/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        self.performSegue(withIdentifier: "completeLogin", sender: nil)
    }
    
}

