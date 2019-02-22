//
//  ViewController.swift
//  Quote_Builder
//
//  Created by Kamal Maged on 2019-02-20.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import UIKit
import os.log

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    func configureCell (quote: Quote) {
        quoteLabel.text = quote.quoteText
        
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SaveQuote {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var objects = [Quote]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        objects.append(quote)
        
    }
    func updateTableView(quote: Quote) {
        objects.append(quote)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === addButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let quoteViewController = segue.destination as! QuoteBuilderViewController
        quoteViewController.delegate = self
       
        
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

