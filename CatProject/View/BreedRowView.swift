//
//  BreedRowView.swift
//  CatProject
//
//  Created by Trí Nguyễn on 08/12/2021.
//

import SwiftUI

struct BreedRowView: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize) // display image
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
    }
}

struct BreedRowView_Previews: PreviewProvider {
    static var previews: some View {
        BreedRowView(breed: Breed.dummyData1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
