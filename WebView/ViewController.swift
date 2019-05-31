//
//  ViewController.swift
//  WebView
//
//  Created by SWL Mohali1 on 31/05/19.
//  Copyright © 2019 SWL Mohali1. All rights reserved.
//

import UIKit

import WebKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WKNavigationDelegate {
    

   
    @IBOutlet weak var webViewContainer: UIView!
    
    @IBOutlet weak var listTbl: UITableView!
    
    @IBOutlet weak var descLbl: UILabel!
    
    let webView = WKWebView()
    
    var webUrl: URL!
    
    let liveUrlStr = "" // This url provided by backend
    
   
    // MARK:- View LifeCycle
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        // This method is for creating the web view
        
        createWebView(urlString: liveUrlStr, containerView: webViewContainer)
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
    
    func createWebView( urlString: String, containerView: UIView) {
        
        let dvWidth = UIScreen.main.bounds.size.width // Dynamic width according to screen.
        
        webView.frame = CGRect(x: 0, y: 0, width: Int(dvWidth), height: 200)
        
        if !urlString.isEmpty
        {
            webView.load(URLRequest(url: URL(string: urlString)!))
        }
       
        webView.navigationDelegate = self
        
        containerView.addSubview(webView)
    
    }
    
    
    // MARK:- IBActions
    
    @IBAction func segmentTap(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0
        {
            listTbl.isHidden = true
            
            webViewContainer.isHidden = false
            
            descLbl.text = "Widget in simple Webview"
        }
        
        else
        {
            listTbl.isHidden = false
            
            webViewContainer.isHidden = true
            
            descLbl.text = "Widget in ListView"
        }
    }
    

    // MARK:- UITableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.row == 0
        {
            return 200
        }
        
        return 50
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            
            let webCell = tableView.dequeueReusableCell(withIdentifier: "webCell") as! WebTableViewCell
            
            // This check help us to resolve the flickering in the web view while scrolling.
            
            if webCell.contentView.viewWithTag(100) == nil
            {
                let webView = WKWebView()
               
                webView.tag = 100
                
                webView.navigationDelegate = self
                
                let dvWidth = UIScreen.main.bounds.size.width
                
                webView.frame = CGRect(x: 0, y: 0, width: Int(dvWidth), height: 200)
                
                if !liveUrlStr.isEmpty
                {
                    let _request = URLRequest(url: URL(string: liveUrlStr)!)
                
                    webView.load(_request)
                }
                
                webCell.contentView.addSubview(webView)
                
                print("yes")
            }
            
            return webCell
            
        }
            
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
            
            cell.cutomLbl.text = "Data \(indexPath.row)"
            
            
            return cell
        }
    }
    
    // MARK:- WEBView Delegates.
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if navigationAction.navigationType == WKNavigationType.linkActivated {
            print("link")
            
            guard let url = navigationAction.request.url, let scheme = url.scheme, scheme.contains("http") else {
                // This is not HTTP link - can be a local file or a mailto
                decisionHandler(.cancel)
                return
            }
            
            print(url)
            
            webUrl = url
            
            self.performSegue(withIdentifier: "web", sender: self)

            decisionHandler(WKNavigationActionPolicy.cancel)
            return
        }
        print("no link")

        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    
    // MARK:- Perform Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "web" {
           
            if let destinationVC = segue.destination as? WebViewController {
                destinationVC.webUrl = webUrl
            }
        }
    }
}
