//
//  WebVision.swift
//  WebUI
//
//  Created by devedbox on 2018/1/16.
//  Copyright © 2018年 AxziplinLib. All rights reserved.
//

import UIKit
import WebKit

public enum WebVisionError: String, Error {
    case invalidGenericRefer = "The refered generic type must be one of `UIWebView` and `WKWebView`"
}

public class WebVision<W> {
    private var _webView: W!
    private let _config: Configuration
    
    init(config: Configuration = .frame(.zero)) throws {
        guard W.self is UIWebView.Type || W.self is WKWebView.Type else {
            throw WebVisionError.invalidGenericRefer
        }
        _config = config
    }
}

extension WebVision where W == WKWebView {
    @available(iOS 8.0, *)
    convenience init(configuration: WKWebViewConfiguration) {
        try! self.init(config: Configuration.config(configuration))
    }
}

extension WebVision where W == UIWebView {
    public convenience init(frame: CGRect) {
        try! self.init(config: Configuration(frame: frame))
    }
}

// MARK: - Configuration.

extension WebVision {
    public struct Configuration {
        /// Frame of the vision's presentation.
        var frame: CGRect
        /// Configuration object of WKWebView.
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
    public var webView: W {
        return _webView
    }
}
