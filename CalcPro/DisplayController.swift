//
//  DisplayController.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import UIKit

class DisplayController: UIViewController {
    
    @IBOutlet weak var screenResult: UILabel!
    
    let output = OutputAdapter.shared
    
    
    func textChanger(value: String){
        print("It's TextChanger!!!")
        screenResult.text = value
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
