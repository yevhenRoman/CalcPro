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
  
   // private var input: String = ""
    private var corectness = true
    private var regexArray = [String]()

    
    private func forming(input: String){
        let idx = CFStringTokenizerAdvanceToNextToken(index as! CFStringTokenizer)
         for index in 0 ..< input.characters.count
         {
            switch input.index(input.startIndex, offsetBy: index) {
            case "+": regexArray.append("S")
            case "-": regexArray.append("S")
            case "×": regexArray.append("S")
            case "±": regexArray.append("S")
            case "×": regexArray.append("S")
            case "(": regexArray.append("B")
            case ")": regexArray.append("b")
            case ".": regexArray.append("P")
            case String(0...9): regexArray.append("D")
         }
    }
        
    func prepare(regaxArray: Array<String>){
        
        for index in 0 ..< regexArray.count {
            
            if regexArray[index] == regexArray[index+1]{
                regexArray.remove(at: index)
            }
        }
    }
    
    //Cheking
    func regaxChecker (regaxArray: Array<String>){
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
    
    func checkGrammer (input: String)->Bool{
        
        forming(input: input)
        prepare(regaxArray: regexArray)
        regaxChecker(regaxArray: regexArray)
        
        return corectness
    }
    
    }}
