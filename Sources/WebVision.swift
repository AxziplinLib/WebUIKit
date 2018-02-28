//
//  WebVision.swift
//  WebUI
//
//  Created by devedbox on 2018/1/16.
//  Copyright © 2018年 AxziplinLib. All rights reserved.
//

import UIKit
import WebKit

public class WebVision<W> {
    private var _webView: W!
    private let _config: Configuration
    
    init?(config: Configuration = .frame(.zero)) {
        precondition(W.self is UIWebView.Type || W.self is WKWebView.Type, "The generic type must be one of `UIWebView` or `WKWebView`.")
        _config = config
    }
}

extension WebVision where W: WKWebView {
    @available(iOS 8.0, *)
    convenience init(configuration: WKWebViewConfiguration) {
        self.init(config: WebVision<W>.Configuration.config(configuration))!
    }
}

// MARK: - Configuration.

extension WebVision {
    public struct Configuration {
        var frame: CGRect
        private var _wkconfig: Any?
        
        @available(iOS 8.0, *)
        var config: WKWebViewConfiguration? { return _wkconfig as? WKWebViewConfiguration }
        
        init(frame: CGRect = .zero, config: Any? = nil) {
            self.frame = frame
            self._wkconfig = config
        }
    }
}

extension WebVision.Configuration {
    static func frame(_ frame: CGRect) -> WebVision.Configuration {
        return WebVision.Configuration(frame: frame)
    }
    
    @available(iOS 8.0, *)
    static func config(_ config: WKWebViewConfiguration, frame: CGRect = .zero) -> WebVision.Configuration {
        return WebVision.Configuration(frame: frame, config: config)
    }
}

// MARK: - UIView Support.

extension WebVision {
    // public var view: UIView! { return _webView }
}
