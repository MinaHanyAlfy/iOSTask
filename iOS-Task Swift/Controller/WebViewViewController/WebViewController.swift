//
//  WebViewController.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-26.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKNavigationDelegate {

    
    var link: String?
    var webView: WKWebView!
    var filmTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = filmTitle
        let url = URL(string: link ?? "")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

}
