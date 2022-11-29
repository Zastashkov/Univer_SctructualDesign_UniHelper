//
//  ViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 27.11.2022.
//

import UIKit
import FirebaseFirestore

class WelcomeViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        logInButton.layer.cornerRadius = 20
        logInButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 20
        registerButton.layer.masksToBounds = true
    }
}

