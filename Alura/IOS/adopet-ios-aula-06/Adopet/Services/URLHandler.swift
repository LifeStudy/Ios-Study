//
//  URLHandler.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import UIKit

class URLHandler {
    func openUrl(_ url: URL,
                 options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
                 completionHandler completion: ((Bool) -> Void)? = nil) {
        UIApplication.shared.open(url, options: options, completionHandler: completion)
    }
    
    func canOpenUrl(_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
}
