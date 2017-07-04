//
//  InputAdpter.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation


class IntputAdapter: InputProtocol {
    
    //Не розумію навіщо це тут, запитати в Сергія
    static let shared = IntputAdapter()
    let brain = PolishBrain.shared
    let checkAdapter = CheckAdapter.shared
    //let checker = Checker.shared
    
    
    func enterNum(_ number: Int){
        
        if checkAdapter.checkGrammer(stringForCheck: String(number)){
        brain.EnterEquation(equation: String(number))
        }
    }
    func enterUtility(_ symbol: String){
        
   if checkAdapter.checkGrammer(stringForCheck: symbol){
       brain.EnterEquation(equation: symbol)
        }
    }
    func enterServiceKey(_ serviceKey: Int) {
        //дописати дії сервісних клавіш
    }
}
