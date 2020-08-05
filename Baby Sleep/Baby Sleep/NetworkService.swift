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
    
    func fatchData() {
        let ref: DatabaseReference = Database.database().reference()
        print("LINK ----- \(ref)")
        ref.observe(.value) { snapshot in
            print(snapshot)
        }
    }
    
}
