//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

let calc = calculator()

var args: [String] = ProcessInfo.processInfo.arguments

args.removeFirst() // remove the name of the program

//check for wrong expression syntax with an operator at args[0]
calc.validateExpression(args: args)

// Calculate high priority operators (*,/,%)
args = calc.findPriorityOperators(args: &args)

// Calculate sum operators (+,-)
args = calc.findSumOperators(args: &args)

print(Int(args[0])!)
