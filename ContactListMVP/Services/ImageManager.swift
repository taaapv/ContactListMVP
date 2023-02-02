//
//  ImageManager.swift
//  ContactListMVP
//
//  Created by Татьяна on 02.02.2023.
//

import Foundation
import Alamofire

class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    func fetchImage(from stringUrl: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.download(stringUrl)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
