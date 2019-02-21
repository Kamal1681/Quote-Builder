//
//  DataModel.swift
//  Quote_Builder
//
//  Created by Kamal Maged on 2019-02-20.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import Foundation

class Quote {
    
    var quoteText: String = ""
    var quoteAuthor: String = ""
    var quotePhoto: Photo = Photo.init()

    func generateQuote() -> Void {
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
        }
        session.resume()
        quotePhoto.generatePhoto()
        
    }
    
}

class Photo {
    func generatePhoto() {
        let photoURL = URL(string: "http://lorempixel.com/200/300/" )
        
        let request = URLRequest.init(url: photoURL)
        let session = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                print("no data returned from server \(String(describing: error?.localizedDescription))")
                return
            }
        
        }
        session.resume()
    }
}
