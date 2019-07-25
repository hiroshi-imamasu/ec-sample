//
//  HomeViewController.swift
//  EC-sample
//
//  Created by Hiroshi Imamasu on 2019/07/02.
//  Copyright © 2019 Repro CRE. All rights reserved.
//
import UIKit
import Repro

class  HomeViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
         Show inApp message.
         The following method is only used when you use splash screen in the app.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/in-app-message.html#id3
         (EN) https://docs.repro.io/en/dev/sdk/in-app-message.html#id3
         */
        
        Repro.showInAppMessage()
        
        
        
        /*
         Set the userID.
         Tips: Basically, you should set userID after you login.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/user-id.html#id
         (EN) https://docs.repro.io/en/dev/sdk/user-id.html#id
         
         */
        
        Repro.set(userID: "cre@example.com")
        
        
        
        /*
         Set the custom event tracking.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/tracking.html#id1
         (EN) https://docs.repro.io/en/dev/sdk/tracking.html#id1
         
         */
        
        Repro.track(event: "home screen", properties: [:])
        
        
        
        /*
         Set the standard user profile.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/user-profile.html#id1
         (EN) https://docs.repro.io/en/dev/sdk/user-profile.html#id1
         */
        
        Repro.setUserProfile(gender: .male)
        
        
        
        /*
         Set the custom user profile.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/user-profile.html#custom-profile
         (EN) https://docs.repro.io/ja/dev/sdk/user-profile.html#custom-profile
         */
        
        Repro.setUserProfile(stringValue: "Developer", forKey: "Job")
        
        navigationItem.title = "home"
        let cartButton = UIBarButtonItem(title: "Cart", style: .plain, target: self, action: #selector(goCart))
        navigationItem.setRightBarButton(cartButton, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ProductCell
        myCell.setupContents(textName: "shoose")
        return myCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Go to ProductDetail screen if item is tapped
        AppDelegate.shared.rootViewController.switchToProductDetailScreen()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        let screenSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let myCollectionView:UICollectionView = UICollectionView(frame:CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height ) , collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(myCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc
    private func logout() {
        // clear the user session (example only, not for the production)
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        // navigate to the Main Screen
    }
    
    
    @objc
    private func goCart() {
        // Go to CartView if cart button is clicked
        AppDelegate.shared.rootViewController.switchToCartScreen()
    }
}



class ProductCell: UICollectionViewCell {
    
    private let NameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupContents(textName: String) {
        NameLabel.text = textName
    }
    
    
    func setUpViews() {
        addSubview(thumbnailImageView)
        addSubview(NameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics:nil, views:["v0":thumbnailImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics:nil, views:["v0":thumbnailImageView]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
