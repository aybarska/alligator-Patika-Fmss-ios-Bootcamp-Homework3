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
        containerView.backgroundColor = .green.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8
        
    }
    
}
