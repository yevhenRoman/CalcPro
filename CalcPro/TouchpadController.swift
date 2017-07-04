//
//  TouchpadController.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import UIKit

enum symbolsUtility: Int{
    case pls = 10001
    case mns = 10002
    case mul = 10003
    case div = 10004
    case pow = 10005
    case sqrt = 10006
    case sin = 10007
    case cos = 10008
    case log = 10009
    case leftBracket = 10010
    case rightBracket = 10011
    case pi = 10012
    case equal = 10013
    case clear = 10014
    case dot = 10015
}

class TouchpadController: UIViewController {

    var onNumTap: ((_ num: Int)->())?
    var onUtilityTap: ((_ symbol: Int)->())?
    let inputAdapter = IntputAdapter.shared
    
    @IBAction func touchOndigit(button: UIButton) {
        onNumTap?(button.tag)
        inputAdapter.enterNum(button.tag)
    }
    @IBAction func touchOnUtility(button: UIButton) {
        onUtilityTap?(button.tag)
        inputAdapter.enterUtility(button.tag)
    }
        
}
    
    
    
       
   
    
    


