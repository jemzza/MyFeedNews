//
//  ViewController.swift
//  MyFeedNews
//
//  Created by Alexander on 02.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .white
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

