//
//  ViewController.swift
//  WebUI
//
//  Created by devedbox on 2018/1/16.
//  Copyright © 2018年 AxziplinLib. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webVision = WebVision<WKWebView>(configuration: WKWebViewConfiguration())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

