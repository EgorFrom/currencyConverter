//
//  AboutViewController.swift
//  lesson1
//
//  Created by mac-223 on 19/01/2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    var strData: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = strData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
