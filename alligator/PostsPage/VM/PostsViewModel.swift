//
//  PostsViewModel.swift
//  alligator
//
//  Created by Ayberk M on 20.09.2022.
//

import Foundation

protocol PostsViewModelViewProtocol:AnyObject {
    func didCellItemFetch(_ items: [PostCellViewModel])
    
    func showEmptyView()
    func hideEmptyView()
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
        let selectedItem = model.posts[index]
        //navigate ? 
    }
    
    
}

private extension PostsViewModel {
    @discardableResult
    func makeViewBasedModel(_ posts: [Post]) -> [PostCellViewModel] { //make data usabe for view
        return []
    }
}

extension PostsViewModel: PostsModelProtocol {
    func didDataFetchProcessFinish(_ isSuccess: Bool) {
        //data we fetch from api
        if isSuccess {
            let posts = model.posts
            let items = makeViewBasedModel(posts)
            
            viewDelegate?.didCellItemFetch(items)
        }else {
            
        }

    }
}
