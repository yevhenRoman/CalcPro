//
//  InputAdpter.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation


class IntputAdapter: InputProtocol {
    
    //Не рохумію навіщо це тут, запитати в Сергія
    static let shared = IntputAdapter()
    
    //це потрібно буде перемістити у CheckAdapter, тут ця штука без потреби
    let brain = PolishBrain.shared
    
    let check = CheckAdapter.shared
    
    func input(value: Int) {
        check.checking(symbol: value)
    }
    
    func input(operation: Operation) {
        //brain.input(operation: operation)
        check.checking(symbol: operation)
    }
    
}
