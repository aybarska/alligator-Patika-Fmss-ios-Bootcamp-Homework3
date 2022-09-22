//
//  PhotosViewModel.swift
//  alligator
//
//  Created by Ayberk M on 21.09.2022.
//

import Foundation


protocol PhotosViewModelViewProtocol:AnyObject {
    func didCellItemFetch(_ items: [PhotosCellViewModel])
    
}

class PhotosViewModel {
    private let model = PhotosModel()
   
    weak var viewDelegate: PhotosViewModelViewProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        let selectedItem = model.photos[index]
        print(selectedItem)
    }
    
}

private extension PhotosViewModel {
    func makeViewBasedModel(_ photos: [Photo]) -> [PhotosCellViewModel] {
        return photos.map{.init(title: $0.title, url: $0.url)}
    }
}

extension PhotosViewModel: PhotosModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        if isSuccess {
            let photos = model.photos
            let items = makeViewBasedModel(photos)
            viewDelegate?.didCellItemFetch(items)
            //hide empty view
        } else {
        //show empty view
        }
    }
}
