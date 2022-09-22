//
//  PhotosCollectionViewCell.swift
//  alligator
//
//  Created by Ayberk M on 21.09.2022.
//

import UIKit


class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagelView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "PhotosCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shapeImage(desiredImage: imagelView)
    }
    
    override func draw(_ rect: CGRect) {
        //make gradient size equal to imageview size
        super.draw(rect)
        //drawGradient(desiredView: imagelView)
    }
    
    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
                
    
    public func shapeImage(desiredImage: UIView) {
        //cool image shape
        desiredImage.layer.cornerRadius = 20
        desiredImage.clipsToBounds = true
        desiredImage.layer.shadowRadius = 20
        desiredImage.layer.shadowOpacity = 1.0
        desiredImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        desiredImage.layer.shadowColor = UIColor.gray.cgColor
    }
}
