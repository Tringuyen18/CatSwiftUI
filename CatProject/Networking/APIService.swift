//
//  APIService.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

import Foundation

struct APIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        // check url
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                // check error
                if let error = error as? URLError {
                    completion(Result.failure(APIError.url(error)))
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                } else if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(type, from: data)
                        completion(Result.success(result)) // call back
                    } catch {
                        completion(Result.failure(APIError.parsing(error as? DecodingError))) // callback
                    }
                }
            }
        }
        task.resume() // connect
    }
    
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void) {
        // check url
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                // check error
                if let error = error as? URLError {
                    completion(Result.failure(APIError.url(error))) // call back
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                } else if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let breeds = try decoder.decode([Breed].self, from: data)
                        completion(Result.success(breeds)) // call back
                    } catch {
                        completion(Result.failure(APIError.parsing(error as? DecodingError))) // callback
                    }
                }
            }
        }
        task.resume() // connect
    }
}
