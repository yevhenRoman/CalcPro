//
//  ProtectionFromFool.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation

//create and inherit protocol for check adapter
class CheckAdapter {
    static let shared = CheckAdapter()
    //Для виводу попереджень і виразу, який буде вписуватись посимвольно
    let output = OutputAdapter.shared
    //Для того, коли користувач натисне дорівнює ми передамо в функцію брейна кінцевий перевірений вираз
    let brain = PolishBrain.shared
    
    func checking(symbol: Int) {
     output.output(value: String(symbol))
        
    }
    func checking(symbol: Operation){
        switch symbol {
        case Operation.pls: output.output(value: "+")
        case Operation.min: output.output(value: "-")
        case Operation.mul: output.output(value: "×")
        case Operation.div: output.output(value: "÷")
        case Operation.equal: output.output(value: "=")
        case Operation.dot: output.output(value: ".")
        //default: break
        }
    }
    
}
