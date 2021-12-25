//
//  APIMockService.swift
//  CatProject
//
//  Created by Trí Nguyễn on 08/12/2021.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        completion(.success([Breed.dummyData1()])) // callback
    }
    
}
