//
//  RootViewController.swift
//  ec-sample
//
//  Created by Trial: Hiroshi Imamasu on 2019/07/24.
//  Copyright © 2019 Repro CRE. All rights reserved.
//
import UIKit


//  This controller is responsible for all screen transitions.


class RootViewController: UIViewController {
    private var current: UIViewController
    
    init() {
        self.current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(current)
        current.view.frame =  CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(current.view)
        view.backgroundColor = UIColor.white
        current.didMove(toParent: self)
    }
    
    func showLoginScreen() {
        
        let new = UINavigationController(rootViewController: LoginViewController())                               // 1
        addChild(new)
        new.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToHomeScreen() {
        let mainViewController = HomeViewController()
        let new = UINavigationController(rootViewController: mainViewController)
        addChild(new)
        new.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToCartScreen() {
        let mainViewController = CartViewController()
        let new = UINavigationController(rootViewController: mainViewController)
        addChild(new)
        new.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToProductDetailScreen() {
        let mainViewController = ProductDetailViewController()
        let new = UINavigationController(rootViewController: mainViewController)
        addChild(new)
        new.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToWebviewScreen() {
        let mainViewController = WebViewController()
        let new = UINavigationController(rootViewController: mainViewController)
        addChild(new)
        new.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
}
