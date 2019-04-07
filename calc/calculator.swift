//
//  calculator.swift
//  calc
//
//  Created by Santiago  on 4/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

class calculator {
    let errorHandler = errorHandling()
    
    // Addition +
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    // Substraction -
    func substract(a: Int, b: Int) -> Int {
        return a - b
    }
    
    // Multiplication *
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    // Division /
    func divide(a: Int, b: Int) -> Int {
        //if right number is 0, exit the program.
        if (b != 0) {
            return a / b
        }
        exit(1);
    }
    
    // Modulo %
    func modulo(a: Int, b: Int) -> Int {
        // if right number is 0, exit the program.
        if (b != 0) {
            return a % b
        }
        exit(1);
    }
    
    // use error handler to validate expression to void result
    func validateExpression(args: [String]) -> Void {
        let arguments = args
        if errorHandler.validateString(args: arguments) {
            return
        }
        exit(1)
    }
    
    // Iterates through array and finds operators
    func findPriorityOperators(args: inout [String]) -> [String] {
        
        var index = 0
        var result: Int = 0
        // Each case has 5 steps:
        // 1. validate both numbers for the operation
        // 2. perform the operation and store result on a variable
        // 3. save result on the first number of the operation
        // 4. Remove both operator and B number of the operation
        // 5. jump back one number to continue iterating
        while index < args.count {
            switch args[index] {
            case "x":
                errorHandler.checkNumbers(a: args[index-1], b: args[index+1])
                result = multiply(a: Int(args[index-1])!, b: Int(args[index+1])!)
                args[index-1] = String(result)
                args.remove(at: index)
                args.remove(at: index)
                index-=1
                break
                
            case "/":
                errorHandler.checkNumbers(a: args[index-1], b: args[index+1])
                result = divide(a: Int(args[index-1])!, b: Int(args[index+1])!)
                args[index-1] = String(result)
                args.remove(at: index)
                args.remove(at: index)
                index-=1
                break
                
            case "%":
                errorHandler.checkNumbers(a: args[index-1], b: args[index+1])
                result = modulo(a: Int(args[index-1])!, b: Int(args[index+1])!)
                args[index-1] = String(result)
                args.remove(at: index)
                args.remove(at: index)
                index-=1
                break

            default:
                if args[index] != "+" && args[index] != "-" && Int(args[index]) == nil{
                    exit(1)
                }
                index+=1
                break
            }
     
            
        }
        return args
    }
    
    func findSumOperators(args: inout [String]) -> [String] {
        var index = 1
        var result: Int = 0
        
        // Each case has 5 steps:
        // 1. validate both numbers for the operation
        // 2. perform the operation and store result on a variable
        // 3. save result on the first number of the operation
        // 4. Remove both operator and B number of the operation
        // 5. jump back one number to continue iterating
        while index < args.count {
            switch args[index] {
            case "+":
                errorHandler.checkNumbers(a: args[index-1], b: args[index+1])

                result = add(a: Int(args[index-1])!, b: Int(args[index+1])!)
                args[index-1] = String(result)
                args.remove(at: index)
                args.remove(at: index)
                index-=1
                break
                
            case "-":
                errorHandler.checkNumbers(a: args[index-1], b: args[index+1])

                result = substract(a: Int(args[index-1])!, b: Int(args[index+1])!)
                args[index-1] = String(result)
                args.remove(at: index)
                args.remove(at: index)
                index-=1
                break
                
            default:
                if Int(args[index]) == nil {
                    exit(1)
                }
            }
            
            index+=1
        }
        return args
    }
    
}
