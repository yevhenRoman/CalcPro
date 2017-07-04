//
//  Checker.swift
//  CalcPro
//
//  Created by Yevhen Roman on 03.07.17.
//  Copyright © 2017 EugeneRoman. All rights reserved.
//

import Foundation

class Checker {
    static let shared = Checker()
    
    //var firstEntrence: Bool
    var counterLeftBrackets: Int = 0   // MUST BE UNRESET
    var counterRightBrackets: Int = 0 // MUST BE UNRESET
    var lastSymbol: String = ""      // Give a "" - we initialize a var
    var currentSymbol: String = ""  // Give a "" - we initialize a var
    var correctInput:Bool = false  //Reminder - need to resetting value every time
    
    private func giveInentificator(input: Int){
        
        switch input {
            
        case symbolsUtility.pls.rawValue: currentSymbol = "S"
        case symbolsUtility.mns.rawValue: currentSymbol = "M" // M: Minus - must have a specific indetificator, because it can be before almost all symbols
        case symbolsUtility.mul.rawValue: currentSymbol = "S"
        case symbolsUtility.div.rawValue: currentSymbol = "S"
        case symbolsUtility.leftBracket.rawValue: currentSymbol = "L"
        case symbolsUtility.rightBracket.rawValue: currentSymbol = "R"
        case symbolsUtility.dot.rawValue: currentSymbol = "P"
        case symbolsUtility.sqrt.rawValue: currentSymbol = "Q" // Q: Need thinking about brackets, because when we open bracket automatically when we use sqrt, so we need to count openBrackets and don't forget for close it
            
        // How to change in one column 0...9 if they have the same indentificator ???
        case 0: currentSymbol = "D"
        case 1: currentSymbol = "D"
        case 2: currentSymbol = "D"
        case 3: currentSymbol = "D"
        case 4: currentSymbol = "D"
        case 5: currentSymbol = "D"
        case 6: currentSymbol = "D"
        case 7: currentSymbol = "D"
        case 8: currentSymbol = "D"
        case 9: currentSymbol = "D"
        default:break
        }
    }
    private func identifyingChecker(){
        
        if(lastSymbol == ""){
            switch currentSymbol {
            // "S" - can't be first symbol because is + , *, /, but NOT MINUS, Minus can be!!!
            case "D": lastSymbol = currentSymbol; correctInput = true
            case "M": lastSymbol = currentSymbol; correctInput = true
            case "L": lastSymbol = currentSymbol; correctInput = true
            case "Q": lastSymbol = currentSymbol; correctInput = true
            default: break
            }
        }
        else{
            switch currentSymbol {
            case "D":
                if( lastSymbol == "D" || lastSymbol == "M" || lastSymbol == "S" || lastSymbol == "P" || lastSymbol == "L"){
                correctInput = true
                    lastSymbol = currentSymbol
                }
            case "S":
                if(lastSymbol == "D" || lastSymbol == "R"){
                    correctInput = true
                    lastSymbol = currentSymbol
                }
            case "M":
                if(lastSymbol == "D" || lastSymbol == "R" || lastSymbol == "L"){
                    correctInput = true
                    lastSymbol = currentSymbol
                }
            case "P": if(lastSymbol == "D"){
                correctInput = true
                lastSymbol = currentSymbol
                }
            case "L": if(lastSymbol == "S" || lastSymbol == "M" || lastSymbol == "L"){
                    correctInput = true
                lastSymbol = currentSymbol
                }
            case "R": if(lastSymbol == "D" || lastSymbol == "R"){
                correctInput = true
                lastSymbol = currentSymbol
                }
            
            case "Q": if(lastSymbol == "D" || lastSymbol == "R"){
                correctInput = true
                lastSymbol = currentSymbol
            }
            default: break
            }
        }
        }
   func checkSymbolForCorrectInput(_ input: Int )->Bool{
    correctInput = false
    giveInentificator(input: input)
    identifyingChecker()
    return correctInput
    }
    
}
