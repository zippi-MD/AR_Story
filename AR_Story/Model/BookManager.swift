//
//  BookManager.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import Foundation

protocol BookManagerDelegate: class {
    func didFinishLoadingBooks(success: Bool) -> Void
}

class BookManager {
    static let sharedInstance = BookManager()
    private(set) var bookCollection: [Book]? {
        willSet {
            let success = newValue != nil ? true : false
            delegate?.didFinishLoadingBooks(success: success)
        }
    }
    
    weak var delegate: BookManagerDelegate?
    
    init() {
        bookCollection = readBooksFromFile()
    }
    
    private func readBooksFromFile() -> [Book]?{
        if  let filePath = Bundle.main.path(forResource: Constants.booksFileName, ofType: Constants.booksExtention),
            let contents = try? String(contentsOfFile: filePath),
            let books = try? JSONDecoder().decode([Book].self, from: Data(contents.utf8)){
            
            return books
            
        }
        
        return nil
    }
}
