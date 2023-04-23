//
//  main.swift
//  NNT
//
//  Created by Projeto Apraxia on 18/04/23.
//

import Foundation

func randomNumbers() -> Int {
    return Int.random(in: 1..<14)
}

func randomOperation() -> Character {
    let operatinos: Array<Character> = ["+", "-", "*"];
    
    let position: Int = Int.random(in: 0..<3);
    return operatinos[position]
}

func solveOperation(num1: Int, num2: Int, operation: Character) -> Int {
    switch operation {
        case "-":
            return num1 - num2;
        case "*":
            return num1 * num2;
    default:
        return num1 + num2;
    }
}

func operationToText(_ operation: Character) -> String {
    switch operation {
        case "-":
            return "minus";
        case "*":
            return "multiplied by";
    default:
        return "plus";
    }
}

func inputAnswer() -> Int {
    print("Your answer: ", terminator: "")
    let input = Int(readLine()!)
    if input != nil {
        return input!
    } else {
        print("invalid value!");
        return inputAnswer()
    }
}

func generateQuestion(num: Int) -> Int {
    let num1 = randomNumbers();
    let num2 = randomNumbers();
    let operation = randomOperation();
    
    print("\(num). What is \(num1) \(operationToText(operation)) \(num2)?")
    let answer = inputAnswer();
    
    if answer == solveOperation(num1: num1, num2: num2, operation: operation) {
        return 1;
    } else {
        return 0;
    }
}




var score = 0;

print("Welcome to iMultiply!\n")

for i in 0..<10 {
    let question = generateQuestion(num: i+1)
    print("\(question == 1 ? "Correct": "Wrong")!\n")
    score += question
}

print(" You scored \(score)")
