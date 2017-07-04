//
//  InputAdpter.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation

class IntputAdapter: InputProtocol {
    
    static let shared = IntputAdapter()
    let brain = PolishBrain.shared
    let checker = Checker.shared
    
    func enterNum(_ number: Int){
        
        if checker.checkSymbolForCorrectInput(number){
        brain.EnterEquation(equation: String(number))
        }
    }
    func enterUtility(_ symbol: Int){
        
   if checker.checkSymbolForCorrectInput(symbol){
       brain.EnterEquation(equation: String(symbol))
        }
    }
}
