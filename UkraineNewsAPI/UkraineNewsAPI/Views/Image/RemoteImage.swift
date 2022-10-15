//
//  RemoteImage.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 15.10.2022.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        if let image = image {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.6), radius: 5, x: 7, y: 7)
        } else {
            Image("news-placeholder")
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct NewsRemoteImage: View {
    
    @StateObject var imageLoder = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoder.image)
            .onAppear {
                imageLoder.load(fromURLString: urlString)
            }
    }
}
