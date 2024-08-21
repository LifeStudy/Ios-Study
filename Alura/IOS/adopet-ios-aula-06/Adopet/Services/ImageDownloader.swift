//
//  ImageDownloader.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

class ImageDownloader {
    func downloadImageData(from url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(data)
            }
        }.resume()
    }
}
