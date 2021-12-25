//
//  BreedFetcher.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

//https://api.thecatapi.com/v1/breeds

import Foundation

class BreedFetcher: ObservableObject {
    
    // MARK: - Properties
    @Published var breeds: [Breed] = []
    @Published var isLoading = false
    @Published var errorMsg: String? = nil
    
    let service: APIServiceProtocol
    
    // MARK: - init
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllBreeds()
    }
    
    // MARK: - API
    func fetchAllBreeds() {
        isLoading = true
        errorMsg = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        service.fetchBreeds(url: url) { [unowned self] result in // memory
            DispatchQueue.main.async { // Main thread
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMsg = error.localizedDescription
                    print(error)
                case .success(let breeds):
                    self.breeds = breeds
                }
            }
        }
    }
    
    // MARK: - Preview Helper
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMsg = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed.dummyData1(), Breed.dummyData2()]
        return fetcher
    }
}
