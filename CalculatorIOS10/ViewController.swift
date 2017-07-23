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
    
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        isFirstNumber=true;
        if let mathematicalSymbol=sender.currentTitle{//可以避免可选类型为nil的情况
            switch mathematicalSymbol{
            case "π" :
                display.text=String(Double.pi);
            case "√":
                let nume=Double(display.text!);//这个num是可选的 因为有可能转换不成功
                display.text=String(sqrt(nume!));
                
            default:
                break;
            }
        }
        
    }
}

