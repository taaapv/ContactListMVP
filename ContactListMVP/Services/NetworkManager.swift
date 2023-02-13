//
//  NetworkManager.swift
//  ContactListMVP
//
//  Created by Татьяна on 30.01.2023.
//

import Foundation
import Alamofire

enum Link: String {
    case randomUserAPI = "https://randomuser.me/api/"
}

class NetworkManager {
    static let shared = NetworkManager()
    
	private let urlParams: Parameters = [
        "results": "\(5)"
    ]
    
    private init() {}
    
    func fetchContactList(completion: @escaping(Result<[Contact], AFError>) -> Void) {
        AF.request(Link.randomUserAPI.rawValue,
				   parameters: urlParams,
				   encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: ContactList.self) { response in
				print(response)
				switch response.result {
                case .success(let contactList):
                    print(contactList)
                    completion(.success(contactList.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
