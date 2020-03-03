//
//  BookCoverCollectionViewCell.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 03/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit

class BookCoverCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var coverTitleLabel: UILabel!
    @IBOutlet private weak var coverBackgroundView: UIView! {
        didSet {
             coverBackgroundView.layer.cornerRadius = Constants.cornerRadius
        }
    }
    
    public var title: String? {
        didSet {
            coverTitleLabel.text = title
        }
    }
    
    public var image: UIImage? {
        didSet {
            coverImageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
