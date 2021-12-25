//
//  LoadingView.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("😹").font(.system(size: 40))
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
