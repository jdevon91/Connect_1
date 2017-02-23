//
//  webViewController.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-02-23.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit

class webViewController: UIViewController {

    let URLPath = "http://www.medeng.com/contact"
    
    @IBOutlet weak var WebView: UIWebView!
    @IBAction func exitBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil) // kills the current view controller
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        loadAddressURL()
    }
    
    func loadAddressURL(){
        let requestURL = NSURL(string: URLPath)
        let request = NSURLRequest(url: requestURL as! URL)
        WebView.loadRequest(request as URLRequest)
    }
}
