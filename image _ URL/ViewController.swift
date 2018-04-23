//
//  ViewController.swift
//  image _ URL
//
//  Created by Chien on 3/30/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img_URL: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let urlkey = "https://2.bp.blogspot.com/-qZV9g4fP2yo/Vm-maS3zx9I/AAAAAAAAXAE/FzFRrRRMyXk/s1600/1e61d234-a089-48eb-b011-c8811147695a.jpg"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        indicator.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoadImage(_ sender: Any) {
        
        if let url = URL (string : urlkey) {
            
            //            do {
            //
            //                let data = try Data(contentsOf: url)
            //                self.img_URL.image = UIImage(data : data)
            //            } catch let err {
            //                print ("Error : \(err.localizedDescription)")
            //            }
            
            indicator.isHidden = false
            URLSession.shared.dataTask(with: url, completionHandler: { (data, resp, error) -> Void in
                
                if ( error == nil && data != nil ) {
                    
                    DispatchQueue.main.async(execute: {
                        self.indicator.isHidden = true
                        self.img_URL.image = UIImage(data : data!)
                    })
                    
                }
                
            }).resume()
            
            
            
        }
        
    }
}

