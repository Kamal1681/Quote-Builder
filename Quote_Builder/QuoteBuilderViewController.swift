//
//  QuoteBuilderViewController.swift
//  Quote_Builder
//
//  Created by Kamal Maged on 2019-02-20.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import Foundation
import UIKit
protocol SaveQuote {
    func updateTableView (quote: Quote) -> Void
}

class QuoteBuilderViewController: UIViewController {
    var delegate: SaveQuote?
    var quote: Quote = Quote()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let objects = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: [:]),
            let view = objects.first as? QuoteView {
           
            self.view.addSubview(view)
            
            self.quote.generateQuote(completion: {
                view.setUpWithQuote(quote: self.quote)
                })
            }
        }

    @IBAction func saveItem(_ sender: Any) {
        self.delegate?.updateTableView(quote: self.quote)
        self.navigationController?.popViewController(animated: true)
    }
    
}
