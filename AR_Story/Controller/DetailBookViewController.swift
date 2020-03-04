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

    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
