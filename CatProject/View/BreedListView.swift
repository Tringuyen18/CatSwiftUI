//
//  BreedListView.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    @State private var searchText: String = ""
    
    var filterBreed: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter { $0.name.contains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterBreed) { breed in
                    NavigationLink(destination: BreedDetailView(breed: breed), label: {
                        BreedRowView(breed: breed)
                    })
                }
            }
            .listStyle(.plain)
            .navigationTitle("Find Your Perfect Cats")
            .searchable(text: $searchText)
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
