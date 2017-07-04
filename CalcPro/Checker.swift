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
    private enum Operation {
        
        case signs (String)
        case bracketOpen (String)
        case bracketClose (String)
        case digits (String)
        case dot (String)
        
    }
    private var input: String = ""
    private var corectness = true
    private var regexArray = [String]()
    
    private var operations: Dictionary<String, Operation> =
        [
            "+": Operation.signs("S"),
            "-": Operation.signs("S"),
            "×": Operation.signs("S"),
            "±": Operation.signs("S"),
            "×": Operation.signs("S"),
            "(": Operation.bracketOpen("B"),
            ")": Operation.bracketClose("b"),
            ".": Operation.dot("P"),
            "1": Operation.digits("D"),
            "2": Operation.digits("D"),
            "3": Operation.digits("D"),
            "4": Operation.digits("D"),
            "5": Operation.digits("D"),
            "6": Operation.digits("D"),
            "7": Operation.digits("D"),
            "8": Operation.digits("D"),
            "9": Operation.digits("D"),
            "0": Operation.digits("D"),
            ]
    //    func checkInput(input: String)//->Bool
    //    {
    //Спочатку треба буде підрахувати кількість дужок
    //це можна буде робити зразу в форі
    
    //треба змінити алгоритм так щоб можна було ставити + - перед числами
    
    //var buffer: String
    //var firstEntrance: Bool = false
    // var transformed: String = ""
    
    //Func
    private func formingRegex(input: String){
        if let operation = operations[input] {
            
            switch operation {
                
            case .signs(let sign):
                regexArray.append(sign)
            case .dot(let dot):
                regexArray.append(dot)
            case .bracketOpen(let bracket1):
                regexArray.append(bracket1)
            case .bracketClose(let bracket2):
                regexArray.append(bracket2)
            case .digits(let digit):
                regexArray.append(digit)
                
            }
        }
    }
    //Prepare string for regax
    private func prepare(regaxArray: Array<String>){
        
        for index in 0 ..< regexArray.count {
            
            if regexArray[index] == regexArray[index+1]{
                regexArray.remove(at: index)
            }
        }
    }
    
    //Cheking
    private func regaxChecker (regaxArray: Array<String>){
        for index in 0 ..< regexArray.count {
            switch regexArray[index] {
                
            case "S":
                // SB or SD - must be
                if !((index != 0)&&(regexArray[index+1] == "B" || regexArray[index+1] == "D")){
                    corectness=false
                }
                if (regexArray[index] == "-" && index == 0 && regexArray[index+1] == "D"){
                    corectness=false
                }
            case "D":
                if !(regexArray[index+1] == "S" || regexArray[index+1] == "P" || regexArray[index+1] == "b" || regexArray[index+1] == "D"){
                    corectness=false
                }
            case "P":
                //Після крапки може бути тільки цифра
                if !(regexArray[index+1] == "D"){
                    corectness=false
                }
            case "B":
                if !(regexArray[index+1] == "D" || regexArray[index+1] == "-"){
                    corectness=false
                }
            case "b":
                if !(regexArray[index+1] == "S" || regexArray[index+1] == "b"){
                    corectness=false
                }
            default: break
            }
        }
    }
    
    func checkGrammer (input: String){
        formingRegex(input: input)
        prepare(regaxArray: regexArray)
        regaxChecker(regaxArray: regexArray)
    }
    
}
