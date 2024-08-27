//
//  UserDefaultsPersistence.swift
//  Tasky
//
//  Created by Giovanna Moeller on 29/05/24.
//

import Foundation

protocol Persistence {
    func saveData(data: Data, forKey key: String)
    func loadData(forKey key: String) -> Data?
}

class UserDefaultsPersistence: Persistence {
    func saveData(data: Data, forKey key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(forKey key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
}
