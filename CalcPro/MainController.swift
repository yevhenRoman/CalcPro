//
//  ViewController.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    var display: DisplayController!
    var touchpad: TouchpadController!
    
    func onNumericTap(num: Int) {
            IntputAdapter.shared.input(value: num)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DisplayControllerSegue", let controller = segue.destination as? DisplayController {
            
            display = controller
        } else if segue.identifier == "TouchpadControllerSegue", let controller = segue.destination as? TouchpadController {
            
            touchpad = controller
            touchpad.touchOnTap = { [weak self] num in self?.onNumericTap(num: num)
            }
        }
        
    
    }

}
