//
//  ViewController.swift
//  alligator
//
//  Created by Ayberk M on 19.09.2022.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = PostsViewModel()
    
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }
}

private extension PostsViewController {
    func makeUI() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    
    func registerCell() {
        tableView.register(.init(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
    }
}

extension PostsViewController: PostsViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showEmptyView() {
        // has to be in main
        DispatchQueue.main.async {
        let noDataImageView = UIImageView(image: UIImage(named: "noData2"))
            noDataImageView.contentMode = .scaleAspectFit
        self.tableView.backgroundView = noDataImageView
        }
    }
    
    func hideEmptyView() {
    
    }
    
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
        
    }
}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell") as! PostsTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescriptionLabel.text = items[indexPath.row].description
        return cell
    }
    
}
