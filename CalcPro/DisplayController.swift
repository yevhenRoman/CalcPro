//
//  DisplayController.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import UIKit

class DisplayController: UIViewController {
    
    @IBOutlet var screenResult: UILabel!
    
   
    var displayValue: String {
        get {
            return screenResult.text!
        }
        set {
            screenResult.text = newValue
        }
    }
    
    let output = OutputAdapter.shared
    
    
    func textChanger(value: String) {
        print("It's TextChanger!!!")
        screenResult.text = value
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.display = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
