//
//  WebProtocol.swift
//  WebUI
//
//  Created by devedbox on 2018/5/5.
//  Copyright © 2018年 AxziplinLib. All rights reserved.
//

import Foundation

/// A protocol represents the comforming types can load and manage the web content
/// represented by `URL` or `URLRequest` resources.
public protocol WebProtocol {
    associatedtype URI = URL
    associatedtype Request = URLRequest
    
    /// Load 
}
