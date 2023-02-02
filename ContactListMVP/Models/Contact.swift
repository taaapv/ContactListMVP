//
//  Contact.swift
//  ContactListMVP
//
//  Created by Татьяна on 30.01.2023.
//

import Foundation

// MARK: - ContactList
struct ContactList: Codable {
    let results: [Contact]
}

// MARK: - Result
struct Contact: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - ID
struct ID: Codable {
    let name, value: String
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

