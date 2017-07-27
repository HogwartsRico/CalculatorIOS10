//
//  ViewController.swift
//  CalculatorIOS10
//
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet weak var display: UILabel?;//显示的数字  @IBOutlet是xcode的标记 类型是UILabel?
    @IBOutlet weak var display: UILabel!;//控件肯定会被初始化，所以强制解包 
    var isFirstNumber:Bool=true;  //自动推导类型  可省略 :Bool
    
    //@IBAction并不是Swift的一部分，是xcode的标记
    @IBAction func touchDigit(_ sender: UIButton) {//下划线一般只会用于第一个参数
        let digit : String = sender.currentTitle!;//加个感叹号，解包出值,但如果没值，程序就崩溃了
        //let digit = sender.currentTitle;//自动推断出是String?
        //print("\(digit) 被按下了");
        if isFirstNumber{
            display.text=digit;
            isFirstNumber=false;
        }else{
            let textCurrentInDisplay=display.text!;
            display.text=textCurrentInDisplay+digit;
            
        }
    }
    
    var displayValue:Double{//Computed property 计算型属性 实时计算变量的值
        get{
            return Double(display.text!)!;
        }
        set{
            display.text=String(newValue);
        }
    }
    
    private var brain = CalculatorBrain();
    @IBAction func performOperation(_ sender: UIButton) {
        if(!isFirstNumber){
            brain.setOperand(displayValue);
            isFirstNumber=true;//在按了加减乘除开根号等等按钮之后，接下来的就是新的数字了
        }
        if let mathematicalSymbol=sender.currentTitle{//可以避免可选类型为nil的情况
            brain.performOperation(mathematicalSymbol);
        }
        if let result=brain.result{//如果有值 取出赋给result 
            displayValue=result;
        }
    }
}

