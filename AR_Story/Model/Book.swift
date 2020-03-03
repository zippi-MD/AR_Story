//
//  Book.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import Foundation

struct Book: Codable {
    let title: String
    let chapters: [Chapter]
    let coverImageName: String
}

struct Chapter: Codable {
    let story: String
    let imageName: String
    let keyWords: [String]
}

