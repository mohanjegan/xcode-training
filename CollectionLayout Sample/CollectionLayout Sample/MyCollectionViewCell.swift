//
//  MyCollectionViewCell.swift
//  CollectionLayout Sample
//
//  Created by Mohan on 12/09/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell{
    static let identifier = "MyCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images: [UIImage] = [
        UIImage(named: "beach"),
        UIImage(named: "mountains"),
        UIImage(named: "sun-flower"),
        UIImage(named: "sunset")
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
