
//
//  WebviewController.swift
//  EC-sample
//
//  Created by Hiroshi Imamasu on 2019/07/08.
//  Copyright © 2019 Repro CRE. All rights reserved.
//
import Foundation
import WebKit
import Repro
import Repro.RPREventProperties

class WebViewController: UIViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame:CGRect(x:0, y:0, width:self.view.bounds.size.width, height:self.view.bounds.size.height))
        /*
         Setup webview tracking
         
         WARNING: You also need to setup Repro.js.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/webview.html#webview
         (EN) https://docs.repro.io/en/dev/sdk/webview.html#webview
         */
        
        Repro.startWebViewTracking(delegate: self)
        webView.navigationDelegate = self
        
        let urlString = "https://hiroshi-imamasu.github.io/cre-ec-sample.io/"
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(url: url! as URL)
        
        webView.load(request as URLRequest)
        
        self.view.addSubview(webView)
        
        
        /*
         Track content viewing using the standard event trackinng.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/tracking.html#standard-event
         (EN) https://docs.repro.io/en/dev/sdk/tracking.html#standard-event
         */
        
        let properties = RPRViewContentProperties()
        Repro.trackViewContentEvent(contentID: "WebView", properties: properties)
        
        
        let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(back))
        navigationItem.setLeftBarButton(backButton, animated: true)
        
        
    }
    
    @objc
    private func back() {
        AppDelegate.shared.rootViewController.switchToProductDetailScreen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
