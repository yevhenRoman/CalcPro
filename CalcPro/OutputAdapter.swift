//
//  OutputAdapter.swift
//  CalcPro
//
//  Created by Yevhen Roman on 02.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation


class OutputAdapter: OutputProtocol {
    
    var display: DisplayController?
    static let shared = OutputAdapter()
    
    
     func presentResult(result: String) {
        
        print("It's \(result) output!!!")
        //display?.textChanger(value: result)
        display?.displayValue = result
    }
    
}
