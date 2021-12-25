//
//  APIServiceProtocol.swift
//  CatProject
//
//  Created by Trí Nguyễn on 08/12/2021.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
