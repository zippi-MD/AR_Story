//
//  DeviceInformation.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit

enum DeviceType {
    case iPhone
    case iPad
}

class DeviceInformation {
    static let sharedInstance = DeviceInformation()
    
    let deviceType: DeviceType
    
    init() {
        deviceType = UIDevice.current.userInterfaceIdiom == .phone ? .iPhone : .iPad
    }
}
