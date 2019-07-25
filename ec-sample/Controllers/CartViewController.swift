//
//  CartViewController.swift
//  EC-sample
//
//  Created Hiroshi Imamasu on 2019/07/05.
//  Copyright © 2019 Repro CRE. All rights reserved.
//
import Foundation
import UIKit
import Repro.RPREventProperties


class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Cart"
        
        
        
        /*
         Track content viewing using the standard event trackinng.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/tracking.html#standard-event
         (EN) https://docs.repro.io/en/dev/sdk/tracking.html#standard-event
         */
        
        let properties = RPRViewContentProperties()
        Repro.trackViewContentEvent(contentID: "CartView", properties: properties)
        
        
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(back))
        navigationItem.setLeftBarButton(backButton, animated: true)
    }
    
    @objc
    private func back() {
        AppDelegate.shared.rootViewController.switchToHomeScreen()
    }
}
