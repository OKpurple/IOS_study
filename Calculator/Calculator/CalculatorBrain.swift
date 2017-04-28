//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by jwh on 2016. 12. 29..
//  Copyright © 2016년 jwh. All rights reserved.
//

import Foundation



class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI), //상수 값을 가지고 있음
        "e" : Operation.Constant(M_E), //M_E
        "√" : Operation.UnaryOperation(sqrt),
        "±" : Operation.UnaryOperation({-$0}),
        "cos" : Operation.UnaryOperation(cos),
        "*" : Operation.BinaryOperation({return $0*$1 }),
        "/" : Operation.BinaryOperation({ $0/$1 }),
        "-" : Operation.BinaryOperation({ $0-$1 }),
        "+" : Operation.BinaryOperation({ $0+$1 }),
        "=" : Operation.Equals
        
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double)->Double) //함수가 인자 더블받아서 더블을 반환
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let associatedConstantVlaue) :
                accumulator = associatedConstantVlaue
            case .UnaryOperation(let associatedFunction) : //asso~Function은 지역변수일뿐
                accumulator = associatedFunction(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending =
                    PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation()
    {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
    }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double,Double)->Double
        var firstOperand: Double
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}
