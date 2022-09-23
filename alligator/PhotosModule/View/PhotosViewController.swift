//
//  PhotosViewController.swift
//  alligator
//
//  Created by Ayberk M on 21.09.2022.
//

import UIKit
import Kingfisher


class PhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = PhotosViewModel()
    
    private var items: [PhotosCellViewModel] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("photos")
        makeUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        
    }
}

private extension PhotosViewController {
    func makeUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize  = CGSize(width: 100, height: 250)
        collectionView.collectionViewLayout = layout
        collectionView.register(PhotosCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}




extension PhotosViewController: PhotosViewModelViewProtocol {
    
    func didCellItemFetch(_ items: [PhotosCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension PhotosViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        KF.url(URL(string: item.url ?? "https://i.ibb.co/mtdQq8t/1.jpg"))
            .set(to: cell.imagelView)
        return cell
    }
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftAndRightPaddings: CGFloat = 20.0 // things gets messy below that number
        let numberOfItemsPerRow: CGFloat = 3.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width + 40)

    }

}
