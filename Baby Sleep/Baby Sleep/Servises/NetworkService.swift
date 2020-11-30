//
//  NetworkService.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 05.08.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import Foundation
import FirebaseDatabase

class NetworkService {
    
    let ref: DatabaseReference = Database.database().reference()
    func fetchData(comletion: @escaping (Result<[Sound], Error>) -> Void) {
        ref.child("sounds").child("nature").observe(.value) { snapshot in
            DispatchQueue.global().async {
                var soundsArray = [Sound]()
                for child in snapshot.children {
                    if let soundSnapshot = child as? DataSnapshot,
                        let sound = Sound(snapshot: soundSnapshot) {
                        soundsArray.append(sound)
                    } else {
                        let error: Error = "Вот тут ошибка" as! Error
                        comletion(.failure(error))
                    }
                }
                comletion(.success(soundsArray))
            }
        }
    }
}
