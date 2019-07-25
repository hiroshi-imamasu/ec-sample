//
//  ProducttDetailView.swift
//  EC-sample
//
//  Created by Hiroshi Imamasu on 2019/07/05.
//  Copyright © 2019 Repro CRE. All rights reserved.
//
import Foundation
import UIKit
import Repro.RPREventProperties
import Repro

class ProductDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "ProductDetail"
        
        /*
         Track content viewing using the standard event trackinng.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/tracking.html#standard-event
         (EN) https://docs.repro.io/en/dev/sdk/tracking.html#standard-event
         */
        
        let properties = RPRViewContentProperties()
        Repro.trackViewContentEvent(contentID: "ProductDetailView", properties: properties)
        
        
        
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(back))
        navigationItem.setLeftBarButton(backButton, animated: true)
        createButton()
    }
    
    @objc
    private func back() {
        AppDelegate.shared.rootViewController.switchToHomeScreen()
    }
    
    
    func createButton() {
        
        let buttonX = 150
        let buttonY = 150
        let buttonWidth = 100
        let buttonHeight = 50
        
        
        let button = UIButton(type: .system)
        button.setTitle("goToWebsite", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        
        
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        button.addTarget(self, action: #selector(goToWebView), for: .touchUpInside)
        
        
        self.view.addSubview(button)
    }
    
    @objc
    private func goToWebView() {
        
        /*
         Track click goToWebview button event using custom event tracking.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/tracking.html#id1
         (EN) https://docs.repro.io/en/dev/sdk/tracking.html#id1
         */
        Repro.track(event: "Click goToWebview", properties: [:])
        
        AppDelegate.shared.rootViewController.switchToWebviewScreen()
   }
}




