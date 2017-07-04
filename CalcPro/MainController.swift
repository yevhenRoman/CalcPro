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
    let inputAdapter = IntputAdapter.shared
    
    
    func onNumericTap(num: Int) {
        inputAdapter.enterNum(num)
    }
    
    func onUtilityTap(symbol: String) {
        inputAdapter.enterUtility(symbol)
    }
    
    func onServiceTap(keyNum: Int) {
        inputAdapter.enterServiceKey(keyNum)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DisplayControllerSegue", let controller = segue.destination as? DisplayController {
            
            display = controller
        } else if segue.identifier == "TouchpadControllerSegue", let controller = segue.destination as? TouchpadController {
            
            touchpad = controller
            
            touchpad.onNumTap = { [weak self] num in self?.onNumericTap(num: num)}
            touchpad.onUtilityTap = { [weak self] symbol in self?.onUtilityTap(symbol: symbol)}
            touchpad.onServiceTap = { [weak self] keyNum in self?.onServiceTap(keyNum: keyNum)}

            
            
        }
        
    
    }

}
