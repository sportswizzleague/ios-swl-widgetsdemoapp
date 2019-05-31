//
//  WebViewController.swift
//  WebView
//
//  Created by SWL Mohali1 on 31/05/19.
//  Copyright © 2019 SWL Mohali1. All rights reserved.
//

import UIKit

import WebKit

class WebViewController: UIViewController {

    var webUrl: URL!
    
    var webView = WKWebView()
    
   
    // MARK:- View LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // This method is for creating the web view
        
        createWebView(weburl: webUrl, containerView: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
    }
    
    
    // MARK:- User Define Functions
    
    func createWebView( weburl: URL, containerView: UIView) {
        
        let dvWidth = UIScreen.main.bounds.size.width   // Dynamic width according to screen.
        
        let dvHeight = UIScreen.main.bounds.size.height // Dynamic height according to screen.
        
        webView.frame = CGRect(x: 0, y: 0, width: Int(dvWidth), height: Int(dvHeight))
        
        webView.load(URLRequest(url: webUrl))
        
        containerView.addSubview(webView)
        
    }
}
