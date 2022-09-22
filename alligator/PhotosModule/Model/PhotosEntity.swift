//
//  PhotosEntity.swift
//  alligator
//
//  Created by Ayberk M on 21.09.2022.
//
import Foundation

struct PhotosCellViewModel {
    
    var title: String?
    var url: String?
}

struct Photo: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
