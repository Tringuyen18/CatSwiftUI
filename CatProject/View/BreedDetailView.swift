//
//  BreedDetailView.swift
//  CatProject
//
//  Created by Trí Nguyễn on 08/12/2021.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    let imageSize: CGFloat = 400
    
    var body: some View {
        ScrollView {
            VStack {
                if breed.image?.url != nil {
                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                                .cornerRadius(5)
                        } else if phase.error != nil {
                            Text(phase.error?.localizedDescription ?? "")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(height: imageSize)
                        }
                    }
                } else {
                    Color.gray.frame(width: imageSize, height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                    Text(breed.breedExplaination)
                    if breed.isHairless {
                        Text("isHairless")
                    }
                    
                    HStack {
                        Text("Energy Level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(breed.energyLevel > id ? Color.blue : Color.yellow)
                        }
                    }
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.dummyData1())
    }
}
