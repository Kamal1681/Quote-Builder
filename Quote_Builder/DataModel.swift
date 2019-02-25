//
//  DataModel.swift
//  Quote_Builder
//
//  Created by Kamal Maged on 2019-02-20.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import Foundation
import UIKit

class Quote {
    
    var quoteText: String = ""
    var quoteAuthor: String = ""

    var quoteImage: UIImage?

    func generateQuote(completion: @escaping (() -> Void)) {
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        
        let request = URLRequest.init(url: url!)
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String,String> else {
                print("data returned is not json, or not valid")
                return
            }
            self.quoteText = json!["quoteText"]!
            self.quoteAuthor = json!["quoteAuthor"]!
            
            
            OperationQueue.main.addOperation {
                completion()
            }
        }
        let photo = Photo()
        photo.generatePhoto(completion: {
            self.quoteImage = photo.image
            OperationQueue.main.addOperation {
                completion()
            }
        })
     
        session.resume()

    }
}

class Photo {
    var image: UIImage?
    
    
    func generatePhoto(completion: @escaping (() -> Void)) {
        let photoURL = URL(string: "http://lorempixel.com/200/300/" )
        let session = URLSession.shared.dataTask(with: photoURL!) { (data, response, error) in
            if let error = error {
                print("Error fetching image:", error)
                return
            }
            
            guard let imageData = data else { return }
            guard let image = UIImage(data: imageData) else { return }
            
            OperationQueue.main.addOperation {
                self.image = image
                completion()
            }
        }
         session.resume()
    }
}
