//
//  RandomContactListPresenter.swift
//  ContactListMVP
//
//  Created by Татьяна on 30.01.2023.
//

import Foundation

protocol RandomContactListPresenterProtocol {
    var contactList: [Contact] { get }
    
    func getContactList(completion: @escaping() -> Void)
    func numberOfItems() -> Int
    func itemPresenter(at indexPath: IndexPath) -> RandomContactPresenterProtocol
}

class RandomContactListPresenter: RandomContactListPresenterProtocol {
    unowned let view: RandomContactListViewProtocol
    var contactList: [Contact] = []
    
    required init(view: RandomContactListViewProtocol) {
        self.view = view
    }
    
    func getContactList(completion: @escaping() -> Void) {
        NetworkManager.shared.fetchContactList { [unowned self] result in
            switch result {
            case .success(let contacts):
                self.contactList = contacts
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfItems() -> Int {
        contactList.count
    }
    
    func itemPresenter(at indexPath: IndexPath) -> RandomContactPresenterProtocol {
        let contact = contactList[indexPath.row]
        return RandomContactPresenter(contact: contact)
    }
}
