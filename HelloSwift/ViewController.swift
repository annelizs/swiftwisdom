//
//  ViewController.swift
//  HelloSwift
//
//  Created by Ann-Elizabeth Salazar on 6/2/14.
//  Copyright (c) 2014 Elizabeth Salazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var quoteText : UILabel!
    @IBOutlet var textLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    
    var titleString : String = ""
    var quoteString : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titleLabel.font = UIFont(name: myFont, size: 32.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func randomQuoteTapped(sender : UIButton) {
        
        //Set my path to file
        let quotePath = NSBundle.mainBundle().pathForResource("QuotesList", ofType: "plist")
        //Save my file as a dictionary
        let quoteDictionary = NSDictionary(contentsOfFile: quotePath!)
        
        //Choose a random number to select a piece of the dictionary
        let randNum = Int(arc4random() % 8)
        //Get array of quotes + references from dictionary so I can reference each one by index value
        let quoteTitleStringArray = quoteDictionary?.allKeys
 
        var chosenQuoteTitle: String = ""
        if let chosenTitle: AnyObject = quoteTitleStringArray?[randNum] {
          chosenQuoteTitle = chosenTitle as! String
        }
        
        var chosenQuote: String = ""
        if let theQuote: AnyObject = quoteDictionary?[chosenQuoteTitle] {
          chosenQuote = theQuote as! String
        }
        
        titleString = chosenQuoteTitle
        quoteString = chosenQuote
        
        quoteText.text = quoteString
        textLabel.text = titleString
        
    }
    
}

