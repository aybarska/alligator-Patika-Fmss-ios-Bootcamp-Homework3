//
//  PostsModel.swift
//  alligator
//
//  Created by Ayberk M on 20.09.2022.
//

import Foundation

protocol PostsModelProtocol:AnyObject {
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class PostsModel {
    weak var delegate: PostsModelProtocol?
    var posts: [Post] = []
    
    func fetchData() {
        
        delegate?.didDataFetchProcessFinish(true)
    }
    
}
