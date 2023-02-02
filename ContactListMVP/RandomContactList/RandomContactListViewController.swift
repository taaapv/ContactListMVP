//
//  RandomContactListViewController.swift
//  ContactListMVP
//
//  Created by Татьяна on 30.01.2023.
//

import UIKit

protocol RandomContactListViewProtocol: AnyObject {
    
}

class RandomContactListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var presenter: RandomContactListPresenterProtocol! {
        didSet {
            presenter.getContactList { [unowned self] in
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Random Contact List"
        setupCollectionView()
        presenter = RandomContactListPresenter(view: self)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension RandomContactListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension RandomContactListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath) as? RandomContactViewCell else { return UICollectionViewCell() }
        cell.presenter = presenter.itemPresenter(at: indexPath)
        return cell
    }
}

extension RandomContactListViewController: RandomContactListViewProtocol {
    
}
