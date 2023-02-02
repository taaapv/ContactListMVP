//
//  RandomContactViewCell.swift
//  ContactListMVP
//
//  Created by Татьяна on 30.01.2023.
//

import UIKit

class RandomContactViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    var presenter: RandomContactPresenterProtocol! {
        didSet {
            nameLabel.text = presenter.name
            ImageManager.shared.fetchImage(from: presenter.image) { [unowned self] result in
                switch result {
                case .success(let data):
                    print(data)
                    self.imageView.image = UIImage(data: data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
