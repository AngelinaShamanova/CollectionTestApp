//
//  ImageView.swift
//  AdApp
//
//  Created by Angelina on 03.01.2021.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(with url: String?) {
        
        guard let url = url else { return }
        guard let imageUrl = url.getUrl() else {
            image = #imageLiteral(resourceName: "menu_holst")
            return
        }
        
        if let cachedImage = getCachedImage(url: imageUrl) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) {data, responce, error in
            
            if let error = error { print(error); return }
            
            guard let data = data, let responce = responce else { return }
            guard let responceUrl = responce.url else { return }
            
            if responceUrl.absoluteString != url { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            self.saveImageToCache(data: data, responce: responce)
        }.resume()
        
    }
    
    private func saveImageToCache(data: Data, responce: URLResponse) {
        
        guard let responceURL = responce.url else { return }
        let cachedResponce = CachedURLResponse(response: responce, data: data)
        URLCache.shared.storeCachedResponse(cachedResponce, for: URLRequest(url: responceURL))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheResponce = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheResponce.data)
        }
        return nil
    }
    
}

fileprivate extension String {
    func getUrl() -> URL? {
        guard let url = URL(string: self) else { return nil }
        return url
    }
}
