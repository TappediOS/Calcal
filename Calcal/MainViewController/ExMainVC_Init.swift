//
//  ExMainVC_Init.swift
//  Calcal
//
//  Created by jun on 2020/02/16.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
   func InitNumber() {
      while true {
         Num.removeAll()
         Num.append(Int(arc4random_uniform(9) + 1))
         Num.append(Int(arc4random_uniform(9) + 1))
         Num.append(Int(arc4random_uniform(9) + 1))
         Num.append(Int(arc4random_uniform(9) + 1))
         
         if Num[0] == Num[1] || Num[0] == Num[2] || Num[0] == Num[3] || Num[0] == Answer {
            Num.removeAll()
            continue
         }
         if Num[1] == Num[2] || Num[1] == Num[3] || Num[1] == Answer {
            Num.removeAll()
            continue
         }
         if Num[2] == Num[3] || Num[2] == Answer || Num[3] == Answer {
            Num.removeAll()
            continue
         }
         print("Answer = \(Answer)")
         print(Num)
         isCalRight()
         break
      }
   }
   
   func InitEachLabel(label: UILabel) {
      label.font = UIFont(name: "Helvetica", size: 30)
      label.layer.borderColor = UIColor.black.cgColor
      label.layer.borderWidth = 2
      label.layer.masksToBounds = true
      label.layer.cornerRadius = 10
      label.textAlignment = NSTextAlignment.center
      label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      label.layer.cornerRadius = 10.0
      label.layer.borderColor = UIColor.black.cgColor
      label.isUserInteractionEnabled = true
      view.addSubview(label)
   }
   
   func InitEachButton(button: UIButton) {
      button.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      button.setTitleColor(UIColor.black, for: .normal)
      button.layer.cornerRadius = 10.0
      button.layer.borderColor = UIColor.black.cgColor
      button.layer.borderColor = UIColor.black.cgColor
      button.isUserInteractionEnabled = true
   }
   
   //一番上のラベルを初期化する
   func InitFormation() {
      let Wide = Size.width / 4
      let Interval = Size.width / 16

      QuestionLabel.frame = CGRect(x: Interval , y: Size.height / 4, width: Wide, height: Wide)
      QuestionLabel.text = "?"
           
      EqualLabel.frame = CGRect(x: Interval * 2 + Wide, y: Size.height / 4, width: Wide, height: Wide)
      EqualLabel.text = "="
           
      AnswerLabel.frame = CGRect(x: Interval * 3 + Wide * 2, y: Size.height / 4, width: Wide, height: Wide)
      AnswerLabel.text = String(Answer)
      
      BackButton.frame = CGRect(x: Interval, y: Size.height * 3.5 / 4, width: Wide, height: Wide)
      BackButton.setTitle("<-", for: .normal)
      BackButton.addTarget(self, action: #selector(self.FormationOneBackLabel), for: .touchUpInside)
      
      ReLoadButton.frame = CGRect(x: Interval * 2 + Wide, y: Size.height * 3.5 / 4, width: Wide, height: Wide)
      ReLoadButton.setTitle("<-", for: .normal)
      ReLoadButton.addTarget(self, action: #selector(self.ReLoad), for: .touchUpInside)
      
      InitEachLabel(label: QuestionLabel)
      InitEachLabel(label: EqualLabel)
      InitEachLabel(label: AnswerLabel)
      InitEachButton(button: BackButton)
      InitEachButton(button: ReLoadButton)
   }
   
   //計算するラベルを初期化する。
   func InitEarchNumberLabel(_ SetLabel: UILabel, _ Number: Int) {
      let Wide = Size.width / 5
      let Interval = Size.width / 25

      SetLabel.frame = CGRect(x: Interval * CGFloat(Number) + Wide * CGFloat(Number - 1), y: Size.height * 2 / 4, width: Wide, height: Wide)
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
      SetLabel.tag = Number
      SetLabel.text = String(Num[Number - 1])
      view.addSubview(SetLabel)
      return
   }
   //計算するラベルを初期化する。
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
      SetButton.titleLabel?.font = UIFont(name: "Helvetica", size: 30)!

      SetButton.setTitleColor(UIColor.black, for: .normal)
      SetButton.layer.borderColor = UIColor.black.cgColor
      SetButton.layer.borderWidth = 2
      SetButton.layer.masksToBounds = true
      SetButton.layer.cornerRadius = 10
      //SetButton.textAlignment = NSTextAlignment.center
      SetButton.layer.cornerRadius = 10.0
      SetButton.layer.borderColor = UIColor.black.cgColor
      switch Num {
      case 1:
         SetButton.setTitle("+", for: .normal)
         SetButton.addTarget(self, action: #selector(self.TapAdd), for: .touchUpInside)
      case 2:
         SetButton.setTitle("-", for: .normal)
         SetButton.addTarget(self, action: #selector(self.TapSub), for: .touchUpInside)
      case 3:
         SetButton.setTitle("*", for: .normal)
         SetButton.addTarget(self, action: #selector(self.TapMul), for: .touchUpInside)
      case 4:
         SetButton.setTitle("/", for: .normal)
         SetButton.addTarget(self, action: #selector(self.TapDiv), for: .touchUpInside)
      default:
         print("err")
      }
      view.addSubview(SetButton)
      
      
      
   }
   
   func InitEarchLabel(_ SetLabel: UILabel, _ Num: Int) {
   
      let Wide = Size.width / 5
      let Interval = Size.width / 25
      
      SetLabel.frame = CGRect(x: Interval * CGFloat(Num) + Wide * CGFloat(Num - 1), y: Size.height * 3 / 4, width: Wide, height: Wide)
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
      SetLabel.tag = (Num + 10)
      switch Num {
      case 1:
         SetLabel.text = "+"
      case 2:
         SetLabel.text = "-"
      case 3:
         SetLabel.text = "×"
      case 4:
         SetLabel.text = "÷"
      default:
         print("error")
      }
      SetLabel.isHidden = true
      view.addSubview(SetLabel)
   }
   
   func InitArithmeticButton() {
      InitEarchButton(Add, 1)
      InitEarchButton(Sub, 2)
      InitEarchButton(Mul, 3)
      InitEarchButton(Div, 4)
      InitEarchLabel(AddLabel, 1)
      InitEarchLabel(AddLabel2, 1)
      InitEarchLabel(AddLabel3, 1)
      InitEarchLabel(SubLabel, 2)
      InitEarchLabel(SubLabel2, 2)
      InitEarchLabel(SubLabel3, 2)
      InitEarchLabel(MulLabel, 3)
      InitEarchLabel(MulLabel2, 3)
      InitEarchLabel(MulLabel3, 3)
      InitEarchLabel(DivLabel, 4)
      InitEarchLabel(DivLabel2, 4)
      InitEarchLabel(DivLabel3, 4)
   }
}
