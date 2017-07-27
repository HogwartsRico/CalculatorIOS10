//
//  CalculatorBrain.swift
//  CalculatorIOS10
//
//  Created by 陈宏杰 on 2017/7/24.
//  Copyright © 2017年 HikVision. All rights reserved.
//

import Foundation
struct CalculatorBrain{
    private var accumulator:Double?;
    
    mutating func  performOperation(_ symbol:String ){
        switch symbol{
        case "π" :
            accumulator=Double.pi;        
        case "√":
            accumulator=sqrt(accumulator!);
        default:
            break;
        }
    }
    
    mutating func setOperand(_ operand: Double){
        //结构体和类的另一个区别： 如果你有一个方法或属性 ，当你在某个方法内 修改它的值 必须加上`mutating`关键字
        accumulator=operand;
    }
    
    var result:Double?{
        get {
            return accumulator;
        }
    }
    
}
