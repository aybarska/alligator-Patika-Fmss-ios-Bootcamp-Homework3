//
//  PostsModel.swift
//  alligator
//
//  Created by Ayberk M on 20.09.2022.
//

import Foundation

protocol PostsModelProtocol:AnyObject {
    func didDataFetch()
}

class PostsModel {
    weak var delegate: PostsModelProtocol?
    
    func fetchData() {
        delegate?.didDataFetch()
    }
    
}
