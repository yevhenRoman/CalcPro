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

    //var touchOnTap: ((_ num: Int)->())?
    var onNumTap: ((_ num: Int)->())?
    var onUtilityTap: ((_ symbol: String)->())?
    var onServiceTap: ((_ keyNum: Int)->())?
    let inputAdapter = IntputAdapter.shared
    
    @IBAction func touchOndigit(button: UIButton) {
        onNumTap?(button.tag)// - навіщо це тут взагалі?
        //inputAdapter.input(value: button.tag)//Маємо передевати тег
        inputAdapter.enterNum(button.tag)
    }
    
    @IBAction func touchOnUtility(button: UIButton) {
        //touchOnTap?(button.tag)  - навіщо це тут взагалі?
        onUtilityTap?(button.currentTitle!)

            switch button.tag {
            case 10001: inputAdapter.enterUtility(".")
            case 10002: inputAdapter.enterUtility("=")
            case 10003: inputAdapter.enterUtility("+")
            case 10004: inputAdapter.enterUtility("-")
            case 10005: inputAdapter.enterUtility("×")
            case 10006: inputAdapter.enterUtility("÷")
            default : break
            }
        }
        
}
    
    
    
       
   
    
    


