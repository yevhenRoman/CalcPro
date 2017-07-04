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
    private var countOfEntrance: Int = 0
    
    private func forming(input: String){
        
        let characters = Array(input.characters)
        
         for index in 0 ..< input.characters.count
         {
            switch characters[index] {
            case "+": regexArray.append("S")
            case "-": regexArray.append("S")
            case "×": regexArray.append("S")
            case "±": regexArray.append("S")
            case "×": regexArray.append("S")
            case "(": regexArray.append("B")
            case ")": regexArray.append("b")
            case ".": regexArray.append("P")
            // Як можна замінити 0...9 ???
            case "0": regexArray.append("D")
            case "1": regexArray.append("D")
            case "2": regexArray.append("D")
            case "3": regexArray.append("D")
            case "4": regexArray.append("D")
            case "5": regexArray.append("D")
            case "6": regexArray.append("D")
            case "7": regexArray.append("D")
            case "8": regexArray.append("D")
            case "9": regexArray.append("D")
            default:break
            }
        }
    }
    
   private func prepare(regaxArray: Array<String>){
        
    for index in 0 ..< regexArray.count-1 {
            
            if ((regaxArray.count != 1)&&(regexArray[index] == regexArray[index+1])){
                regexArray.remove(at: index)
            }
        }
    }
    
    //Cheking
  private  func regaxChecker (regaxArray: Array<String>){
    while (countOfEntrance < regexArray.count-1) {
            switch regexArray[countOfEntrance] {
            
            case "S":
                // SB or SD - must be
                if (regaxArray.count != 1 ) && (!((countOfEntrance != 0)&&(regexArray[countOfEntrance+1] == "B" || regexArray[countOfEntrance+1] == "D"))){
                    corectness=false
                }
                if (regexArray[countOfEntrance] == "-" && countOfEntrance == 0 && regexArray[countOfEntrance+1] == "D"){
                    corectness=false
                }
            case "D":
                if ((regaxArray.count != 1 ) && !((regexArray[countOfEntrance+1] == "S" || regexArray[countOfEntrance+1] == "P" || regexArray[countOfEntrance+1] == "b" || regexArray[countOfEntrance+1] == "D"))){
                    corectness=false
                }
            case "P":
                //Після крапки може бути тільки цифра
                if (regaxArray.count != 1 ) && !((regexArray[countOfEntrance+1] == "D")){
                    corectness=false
                }
            case "B":
                if (regaxArray.count != 1 )&&(!((regexArray[countOfEntrance+1] == "D" || regexArray[countOfEntrance+1] == "-"))){
                    corectness=false
                }
            case "b":
                if (regaxArray.count != 1 )&&(!((regexArray[countOfEntrance+1] == "S" || regexArray[countOfEntrance+1] == "b"))){
                    corectness=false
                }
            default: break
            }
            if !corectness {
                break
            }
        }
    }
    
    func checkGrammer (stringForCheck: String)->Bool{
        
        forming(input: stringForCheck)
        prepare(regaxArray: regexArray)
        regaxChecker(regaxArray: regexArray)
        countOfEntrance += 1
        return corectness
    }
    
    }
