//
//  BookCollectionViewController.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 03/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit

class BookCollectionViewController: UIViewController {
    
    var bookManager: BookManager = BookManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookManager.delegate = self
        bookManager.loadBookCollection()
    }
    


}

extension BookCollectionViewController: BookManagerDelegate {
    func didFinishLoadingBooks(success: Bool) {
        
    }
}
