//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import UIKit

class ExternalLinksHandler {
    
    private var urlHandler = URLHandler()
    
    func openTelephoneUrl(phoneNumber: String) {
        guard let phoneURL = URL(string: "tel://\(phoneNumber)") else { return }
        urlHandler.openUrl(phoneURL)
    }
    
    func openWhatsappUrl(phoneNumber: String, message: String) {
        guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else { return }
        
        if urlHandler.canOpenUrl(whatsappURL) {
            urlHandler.openUrl(whatsappURL)
        } else {
            openWhatsappInAppStore()
        }
    }
    
    private func openWhatsappInAppStore() {
        guard let appStoreURL = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else { return }
        urlHandler.openUrl(appStoreURL)
    }
}
