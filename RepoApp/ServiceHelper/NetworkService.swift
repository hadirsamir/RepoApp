//
//  NetworkService.swift
//  RepoApp
//
//  Created by Mac on 12/8/20.
//

import Foundation
import ObjectMapper
import UIKit

class NetworkService {
    
    static var sharedInstance = NetworkService()
    // Create the session object
    let session = URLSession.shared
    
    func getDataFromNetwork<T:Mappable>(urlString: String, completion: @escaping(_ object : T) -> Void,onError : @escaping(_ error: NSError) -> Void) {
        // Create the url with NSURL
        let url = URL(string: urlString)! //change the url
        
        // Now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        session.dataTask(with: request) {data, response, error in
            if let error = error {
                onError(error as  NSError)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                let dataData = Mapper<T>().map(JSON: json!)
                completion(dataData!)
            } catch {
                print("JSON error: \(error.localizedDescription)")
                onError(error as NSError)
            }
        }.resume()
    }
    
}
// urlSession datTask to retrieve image
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
            contentMode = mode
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
            guard let url = URL(string: link) else { return }
            downloaded(from: url, contentMode: mode)
        }
}
