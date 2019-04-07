//
//  errorHandling.swift
//  calc
//
//  Created by Santiago  on 4/3/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

class errorHandling {
    
    // This function checks the string for any fatal mistakes
    func validateString(args: [String]) -> Bool {
        // step 1: validate length of args array mathematically
        if args.count % 2 == 0 {
            exit(1)
        }
        
        // step 2: check if beginning or end are an operator
        if Int(args[0]) == nil || Int(args[args.count - 1]) == nil  {
            exit(1)
        }
        
        var index: Int = 0
        
        while index < args.count {
            
            // step 3: check if argument contains a decimal point and exit if true
            if args[index].contains(".") {
                exit(1)
            }
            
            // step 4: check if every even ordered argument is an integer
            if index % 2 == 0 && Int(args[0]) == nil {
                exit(1)
            }
            
            index+=1
        }
        return true
    }
    
    // function that checks if a string is an integer
    func isNumeric(a: String) -> Bool {
        return Int(a) != nil
    }
    
    func checkNumbers(a: String, b: String) -> Void {
        if isNumeric(a: a) && isNumeric(a: b) {
            return
        }
        exit(1)
    }
}

