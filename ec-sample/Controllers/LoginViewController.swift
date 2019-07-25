//
//  LoginViewController.swift
//  EC-sample
//
//  Created by Hiroshi Imamasu on 2019/07/04.
//  Copyright © 2019 Repro CRE. All rights reserved.
//
import Foundation
import UIKit
import Repro

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)
    }
    @objc
    private func login() {
        // store the user session (example only, not for the production)
        UserDefaults.standard.set(true, forKey: "LOGGED_IN")
        
        
        /*
         Track click login button event using custom event tracking.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/tracking.html#id1
         (EN) https://docs.repro.io/en/dev/sdk/tracking.html#id1
         */
        
        Repro.track(event: "Click login", properties: [:])
        
        
        
        // navigate to the Main Screen
        AppDelegate.shared.rootViewController.switchToHomeScreen()
    }
}
