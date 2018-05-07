//
//  WebViewController.swift
//  WebUI
//
//  Created by devedbox on 2018/5/5.
//  Copyright © 2018年 AxziplinLib. All rights reserved.
//

import UIKit
import WebKit
import Foundation

public typealias WKWebViewController = WebViewController<WKWebView>
public typealias UIWebViewController = WebViewController<UIWebView>

open class WebViewController<W: UIView>: UIViewController {
    /// Initial url of the web content.
    private let _initialUrl: URL?
    /// The web vision to presentation the web content.
    private let _vision = try! WebVision<W>()
    
    init(url: URL) {
        _initialUrl = url
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        _initialUrl = nil
        super.init(coder: aDecoder)
    }
    
    // MARK: Life Cycle.
    
    open override func loadView() {
        super.loadView()
        _setUpWebView()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Load initial url of the web view controller if any.
        
    }
}

// MARK: - Private.

extension WebViewController {
    /// Set up web view and add to the root view of the view controller.
    private func _setUpWebView() {
        view.addSubview(_vision.webView)
        
        let viewBindings = ["view": _vision.webView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|view|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewBindings))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|view|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: viewBindings))
    }
}
