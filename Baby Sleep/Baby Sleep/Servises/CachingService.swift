//
//  CachingService.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 13.08.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import Foundation
import FirebaseStorage

class CashingService {

    
    private func getLocalUrl(fileName: String) -> URL? {
        
        guard let cacheDir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        let url = cacheDir.appendingPathComponent(fileName, isDirectory: true)
        
        if !FileManager.default.fileExists(atPath: url.path) {
            try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        }
       
        return url
    }
    
    public func cashingAudio(shortLink: String, fileName: String, comletion: @escaping (Result<URL, Error>) -> Void) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let isLandRef = storageRef.child(shortLink)
        guard let localURL = getLocalUrl(fileName: fileName) else { return }
        print(localURL)
        
        let downloadTask = isLandRef.write(toFile: localURL)
        
        downloadTask.observe(.success) { snapshot in
            if let error = snapshot.error {
                comletion(.failure(error))
            } else {
                comletion(.success(localURL))
            }
        }
    }
}
