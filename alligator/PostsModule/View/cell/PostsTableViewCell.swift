//
//  PostsTableViewCell.swift
//  alligator
//
//  Created by Ayberk M on 20.09.2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private(set) weak var postTitleLabel: UILabel!
    @IBOutlet private(set) weak var postDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        containerView.backgroundColor = .blue.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8
        
    }
    
}
