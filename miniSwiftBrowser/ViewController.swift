//
//  ViewController.swift
//  miniSwiftBrowser
//
//  Created by 탁제원 on 2022/01/18.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        wkWebView.navigationDelegate = self
        
        let myURL = "http://www.facebook.com"
        let myRequest = URLRequest(url: URL(string: myURL)!)
        self.wkWebView.load(myRequest)
        
        urlTextField.text = myURL
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = urlTextField.text
        
        if !((urlString?.hasPrefix("http://"))!){
            urlString = String(format: "http://%@", urlString!)
        }
        
        let textFieldRequest = URLRequest(url: URL(string: urlString!)!)
        self.wkWebView.load(textFieldRequest)
        
        
        urlTextField.resignFirstResponder()
        
        return true
    }

    @IBAction func bookmarkAction(_ sender: Any) {
        
        let bookmarkTitle = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        
        let bookmarkURL = String(format: "http://www.%@.com", bookmarkTitle!)
        let bookmarkRequest = URLRequest(url: URL(string: bookmarkURL)!)
        self.wkWebView.load(bookmarkRequest)
        
        urlTextField.text = bookmarkURL
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicatorView.stopAnimating()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.wkWebView.goBack()
    }
    
    @IBAction func stopLoading(_ sender: Any) {
        self.wkWebView.stopLoading()
    }
    
    @IBAction func reload(_ sender: Any) {
        self.wkWebView.reload()
    }
    
    @IBAction func goForward(_ sender: Any) {
        self.wkWebView.goForward()
    }
    
}

