//
//  Model.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 12.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


struct Model {
    var name: String
    var image: UIImage
    var audio: String
    var color: natureColor
}

enum natureColor {
    case watterFallColor
    case forestColor
    case streamColor
    case seaColor
    case rainColor
    case stormColor
    case hairdryerColor
    case whiteNoiseColor
    case vacuumColor
    case hoodsColor
    case carColor
    
}
