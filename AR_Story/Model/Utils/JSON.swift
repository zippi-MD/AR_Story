//
//  JSON.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import Foundation

func encodeIntoJSONString<T: Codable>(data: T) -> String? {
    let jsonEncoder = JSONEncoder()
    
    if let jsonData = try? jsonEncoder.encode(data), let jsonString = String(data: jsonData, encoding: .utf8) {
        return jsonString
    }
    else {
        return nil
    }
}
