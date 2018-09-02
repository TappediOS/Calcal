//
//  ViewController.swift
//  Calcal
//
//  Created by jun on 2018/08/18.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
   let Size: CGSize = UIScreen.main.bounds.size
   let Add = UIButton()
   let Sub = UIButton()
   let Mul = UIButton()
   let Div = UIButton()
   var Fadd: Bool = false
   var Fsub: Bool = false
   var Fmul: Bool = false
   var Fdiv: Bool = false
   
   let FirstLabel = UILabel()
   let SecondLabel = UILabel()
   let ThirdLabel = UILabel()
   let ForthLabel = UILabel()
   var Ffirst: Bool = false
   var Fsecond: Bool = false
   var Fthird: Bool = false
   var Ffourth: Bool = false

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
      view.accessibilityIgnoresInvertColors = true
      view.backgroundColor = UIColor.white
      
      InitArithmeticButton()
      InitNumbreLabel()
   }
   
   func InitEarchNumberLabel(_ SetLabel: UILabel, _ Num: Int) {
      
      let Wide = Size.width / 5
      let Interval = Size.width / 25

      SetLabel.frame = CGRect(x: Interval * CGFloat(Num) + Wide * CGFloat(Num - 1), y: Size.height * 2 / 4, width: Wide, height: Wide)
      SetLabel.font = UIFont(name: "Helvetica", size: 30)
      SetLabel.layer.borderColor = UIColor.black.cgColor
      SetLabel.layer.borderWidth = 2
      SetLabel.layer.masksToBounds = true
      SetLabel.layer.cornerRadius = 10
      SetLabel.textAlignment = NSTextAlignment.center
      SetLabel.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      SetLabel.layer.cornerRadius = 10.0
      SetLabel.layer.borderColor = UIColor.black.cgColor
      SetLabel.isUserInteractionEnabled = true
      switch Num {
      case 1:
         SetLabel.text = "43"
      case 2:
         SetLabel.text = "4"
      case 3:
         SetLabel.text = "7"
      case 4:
         SetLabel.text = "10"
      default:
         print("error")
      }
      view.addSubview(SetLabel)
      return
   }
   
   func InitNumbreLabel() {
      InitEarchNumberLabel(FirstLabel, 1)
      InitEarchNumberLabel(SecondLabel, 2)
      InitEarchNumberLabel(ThirdLabel, 3)
      InitEarchNumberLabel(ForthLabel, 4)
   }
   
   func InitEarchButton(_ SetButton: UIButton, _ Num: Int){
      
      let Wide = Size.width / 5
      let Interval = Size.width / 25
      
      SetButton.frame = CGRect(x: Interval * CGFloat(Num) + Wide * CGFloat(Num - 1), y: Size.height * 3 / 4, width: Wide, height: Wide)
      SetButton.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      SetButton.setTitle("+", for: .normal)
      SetButton.setTitleColor(UIColor.black, for: .normal)
      SetButton.layer.cornerRadius = 10.0
      SetButton.layer.borderColor = UIColor.black.cgColor
      switch Num {
      case 1:
         SetButton.setTitle("+", for: .normal)
         SetButton.addTarget(self, action: #selector(ViewController.TapAdd), for: .touchUpInside)
      case 2:
         SetButton.setTitle("-", for: .normal)
         SetButton.addTarget(self, action: #selector(ViewController.TapSub), for: .touchUpInside)
      case 3:
         SetButton.setTitle("*", for: .normal)
         SetButton.addTarget(self, action: #selector(ViewController.TapMul), for: .touchUpInside)
      case 4:
         SetButton.setTitle("/", for: .normal)
         SetButton.addTarget(self, action: #selector(ViewController.TapDiv), for: .touchUpInside)
      default:
         print("err")
      }
      view.addSubview(SetButton)
      
   }
   
   func InitArithmeticButton() {
      InitEarchButton(Add, 1)
      InitEarchButton(Sub, 2)
      InitEarchButton(Mul, 3)
      InitEarchButton(Div, 4)
   }
   
   @objc func TapAdd() {
      Fadd = MoveAdd(flag: Fadd, MoveButton: Add)
      Add.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Add.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
   }
   @objc func TapSub() {
      Fsub = MoveAdd(flag: Fsub, MoveButton: Sub)
      Sub.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Sub.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
   }
   @objc func TapMul() {
      Fmul = MoveAdd(flag: Fmul, MoveButton: Mul)
      Mul.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Mul.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
   }
   @objc func TapDiv() {
      Fdiv = MoveAdd(flag: Fdiv, MoveButton: Div)
      Div.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Div.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
   }

   
   func MoveAdd(flag: Bool, MoveButton: UIButton) -> Bool{
      
      return true
      
   }
   
   func AnimateLabel(target:UIView){

      
      // アニメーション
      UIView.transition(with: target, duration: 1, options: .curveEaseInOut, animations: { () -> Void in
         
         // 画面右まで移動
         //migigawamadeidou
         target.frame.origin.x = self.view.bounds.width
         
      }, completion: { _ in
         self.AnimateLabel(target: target)
      })
   }
   
   
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
      for touch: AnyObject in touches {
         let touched: UITouch = touch as! UITouch
         
         switch touched.view {
         case FirstLabel:
            print("first")
            AnimateLabel(target: FirstLabel)
            print("first")
         case SecondLabel:
            print("second")
         case ThirdLabel:
            print("third")
         case ForthLabel:
            print("forth")
         default:
            print("false")
            break
         }
      }
   }
   
   

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

