//
//  TouchpadController.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import UIKit

//Add some cases in it
//    enum UtiІlityButton: Int {
//        case dot = 10001
//        case equal = 10002
//    }

class TouchpadController: UIViewController {

    var touchOnTap: ((_ num: Int)->())?
    let inputAdapter = IntputAdapter.shared
    @IBAction func touchOndigit(button: UIButton) {
        //touchOnTap?(button.tag) - навіщо це тут взагалі?
        inputAdapter.input(value: button.tag)//Маємо передевати тег
    }
    
    @IBAction func touchOnUtility(button: UIButton) {
        //touchOnTap?(button.tag)  - навіщо це тут взагалі?

            switch button.tag {
            case 10001: inputAdapter.input(operation: Operation.dot)
            case 10002: inputAdapter.input(operation: Operation.equal)
            case 10003: inputAdapter.input(operation: Operation.pls)
            case 10004: inputAdapter.input(operation: Operation.min)
            case 10005: inputAdapter.input(operation: Operation.mul)
            case 10006: inputAdapter.input(operation: Operation.div)
            default : break
            }
        }
        
}
    
    
    
       
   
    
    


