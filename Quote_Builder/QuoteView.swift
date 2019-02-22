//
//  QuoteView.swift
//  Quote_Builder
//
//  Created by Kamal Maged on 2019-02-20.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import Foundation
import UIKit

class QuoteView: UIView {
    @IBOutlet weak var qouteText: UILabel!
    @IBOutlet weak var qouteAuthor: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    func setUpWithQuote(quote: Quote) {
        self.qouteText.text = quote.quoteText
        self.qouteAuthor.text = quote.quoteAuthor
        self.image.image = quote.quoteImage
    }
}
