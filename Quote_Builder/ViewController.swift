//
//  ViewController.swift
//  Quote_Builder
//
//  Created by Kamal Maged on 2019-02-20.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    func configureCell (quote: Quote) {
        quoteLabel.text = quote.quoteText
        
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, saveQuote {
    var objects = [Quote]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateTableView()
        
        
    }
    func updateTableView() {
        for quote in objects {
            quote.generateQuote()
            objects.append(quote)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        let object = objects[indexPath.row]
        cell.configureCell(quote: object)
        
        return cell
        
    }
    
}

