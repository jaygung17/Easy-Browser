//
//  ViewController.swift
//  Easy Browser
//
//  Created by Agung Luo on 25/05/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView : WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let url = URL(string: "https://developeracademy.apps.binus.ac.id")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    

    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com.sg", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "binus.ac.id", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action:  UIAlertAction){
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    
    }
}

