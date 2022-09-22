//
//  PostsEntity.swift
//  alligator
//
//  Created by Ayberk M on 20.09.2022.
//

import Foundation

struct PostCellViewModel {
    
    var title: String?
    var description: String?
    
}

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
