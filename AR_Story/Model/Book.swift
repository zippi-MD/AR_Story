//
//  Book.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import Foundation

struct Book {
    let title: String
    let chapters: [Chapter]
    let coverImageName: String
}

struct Chapter {
    let story: String
    let imageName: String
    let keyWords: [String]
}

