//
//  BookCollectionViewController.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 03/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit

class BookCollectionViewController: UIViewController {
    
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    var bookManager: BookManager = BookManager.sharedInstance
    var selectedIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookManager.delegate = self
        bookManager.loadBookCollection()
        
        booksCollectionView.register(UINib(nibName: "BookCoverCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.BookCoverCellIdentifier)
        
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailBookViewController,
            let index = selectedIndex {
            destination.book = bookManager.bookCollection[index.row]
        }
    }

}

//MARK: CollectionView Delegates
extension BookCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookManager.bookCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.BookCoverCellIdentifier, for: indexPath)
        
        guard let coverCell = cell as? BookCoverCollectionViewCell else { return cell }
        
        let book = bookManager.bookCollection[indexPath.row]
        
        coverCell.title = book.title
        
        return coverCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let windowFrame = UIApplication.shared.windows.first!.frame
        
        switch traitCollection.horizontalSizeClass {
            
        case .compact:
            return CGSize(width: windowFrame.width * 0.8, height: windowFrame.height * 0.5)
        case .regular, .unspecified:
            return CGSize(width: windowFrame.width/5, height: windowFrame.height/3)
        @unknown default:
            return CGSize(width: 100, height: 150)
            assert(true, "Missing TraitCollection Horizontal Class")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        performSegue(withIdentifier: "BookCollectionToBookDetailView", sender: nil)
    }
    
}

extension BookCollectionViewController: BookManagerDelegate {
    func didFinishLoadingBooks(success: Bool) {
        
    }
}
