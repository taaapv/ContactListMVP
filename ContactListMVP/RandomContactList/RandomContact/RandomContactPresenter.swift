//
//  RandomContactPresenter.swift
//  ContactListMVP
//
//  Created by Татьяна on 30.01.2023.
//

import Foundation

protocol RandomContactPresenterProtocol {
    var name: String { get }
    var image: String { get }
    init(contact: Contact)
    
}

class RandomContactPresenter: RandomContactPresenterProtocol {

    var name: String {
        contact.name.first + " " + contact.name.last
    }
    var image: String {
        contact.picture.thumbnail
    }
    
    private let contact: Contact
    
    required init(contact: Contact) {
        self.contact = contact
    }
    
    
}
