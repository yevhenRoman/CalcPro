//
//  OutputAdapter.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation


class OutputAdapter: OutputProtocol {
    
    static let shared = OutputAdapter()
    
    var display = DisplayController?
    
    func output(value: String) {
        print("It's output!!!")
        display?.textChanger(value: value)
    }
}
