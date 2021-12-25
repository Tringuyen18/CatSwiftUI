//
//  ErrorView.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var breedFetcher: BreedFetcher
    
    var body: some View {
        VStack {
            Text("😿").font(.system(size: 80))
            
            Text(breedFetcher.errorMsg ?? "")
            
            Button(action: {
                breedFetcher.fetchAllBreeds()
            }, label: {
                Text("Try again")
            })
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
