//
//  CodedTableViewCell.swift
//  MultipleCustomCells
//
//  Created by Mohan on 14/09/22.
//

import UIKit

class CodedTableViewCell: UITableViewCell {
    
    
    static let identifier = "CodedTableViewCell"
    
    private let mylabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    public func configure(){
        
        contentView.addSubview(mylabel)
        contentView.addSubview(myImageView)
        
        mylabel.text = "welcome"
        mylabel.textAlignment = .center
        myImageView.image = UIImage(named: "Image2")
        myImageView.contentMode = .scaleAspectFit
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 5, y: 0, width: 50, height: 50)
        mylabel.frame = CGRect(x: 105, y: 0, width: contentView.frame.size.width, height: 50)
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 50.0
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
