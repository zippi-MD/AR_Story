//
//  DetailBookViewController.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 03/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit

class DetailBookViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookDescriptionTextView: UITextView!
    @IBOutlet weak var startReadingButtonBackgroundView: UIView! {
        didSet {
            startReadingButtonBackgroundView.layer.cornerRadius = Constants.cornerRadius
        }
    }
    
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if book == nil { dismissButtonTapped(nil)}
    }
    
    private func setupUI(){
        if let book = book {
            coverImageView.image = UIImage(named: book.coverImageName)
            bookTitleLabel.text = book.title
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailToLectureSegue" {
            
        }
    }

    @IBAction func dismissButtonTapped(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startReadingButtonTapped(_ sender: Any?) {
        performSegue(withIdentifier: "DetailToLectureSegue", sender: nil)
    }
}
