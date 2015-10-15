//
//  calculatorBrain.swift
//  calculator
//
//  Created by Max on 15/9/23.
//  Copyright (c) 2015年 Maxzsc. All rights reserved.
//

import Foundation

class calculatorBrain{
    enum Op{
        case operand(Double)
        case UnaryOperation(String , Double->Double )
        case BinaryOperation(String , (Double,Double)->Double )
    }
    var opStack = [Op]()
    
    func pushOperand(op:Double){
        opStack.append(Op.operand(op))
    }
    
    func popOperand(){
        opStack.removeLast();
    }
    
    
}
