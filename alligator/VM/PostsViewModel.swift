//
//  PostsViewModel.swift
//  alligator
//
//  Created by Ayberk M on 20.09.2022.
//

import Foundation

protocol PostsViewModelViewProtocol:AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
}


class PostsViewModel {
    private let model = PostsModel()

    weak var viewDelegate: PostsViewModelViewProtocol?
    
    init(){
        model.delegate = self
    }
    
   func didViewLoad() {
        model.fetchData()
    }
    
    func didClickItem(at index: Int) {
        //todo
    }
    
    
}

private extension PostsViewModel {
    @discardableResult
    func makeViewBasedModel() -> [PostCellViewModel] { //make data usabe for view
        return []
    }
}

extension PostsViewModel: PostsModelProtocol {
    func didDataFetch() { //data we fetch from api
        let items = makeViewBasedModel()
        viewDelegate?.didCellItemFetch(items)
    }
}
