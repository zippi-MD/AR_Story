//
//  BookManager.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import Foundation

class BookManager {
    static let sharedInstance = BookManager()
    private(set) var bookCollection: [Book]?
}
