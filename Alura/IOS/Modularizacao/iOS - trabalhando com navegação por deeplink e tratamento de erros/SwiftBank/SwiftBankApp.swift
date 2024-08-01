//
//  SwiftBankApp.swift
//  SwiftBank
//
//  Created by Alura on 27/12/23.
//

import SwiftUI

@main
struct SwiftBankApp: App {
    
    @StateObject private var routerManager = NavigationRouter.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(routerManager)
                .onOpenURL(perform: { url in
                    handleDeeplink(from: url)
                })
        }
    }
}

extension SwiftBankApp {
    func handleDeeplink(from url: URL) {
        let routerHandler = RouterHandler()
        Task {
            if let route = await routerHandler.find(from: url) {
                routerManager.push(to: route)
            }
        }
    }
}
