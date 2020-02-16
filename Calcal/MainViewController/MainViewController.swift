//
//  ViewController.swift
//  Calcal
//
//  Created by jun on 2018/08/18.
//  Copyright © 2018年 jun. All rights reserved.
//

import UIKit
import AudioToolbox

class MainViewController: UIViewController {
  
   let Size: CGSize = UIScreen.main.bounds.size
   let Add = UIButton()
   let Sub = UIButton()
   let Mul = UIButton()
   let Div = UIButton()
   let AddLabel = UILabel()
   let SubLabel = UILabel()
   let MulLabel = UILabel()
   let DivLabel = UILabel()
   var AddCount = 0
   var SubCount = 0
   var MulCount = 0
   var DivCount = 0
   
   var AddLabel2 = UILabel()
   var AddLabel3 = UILabel()
   var SubLabel2 = UILabel()
   var SubLabel3 = UILabel()
   var MulLabel2 = UILabel()
   var MulLabel3 = UILabel()
   var DivLabel2 = UILabel()
   var DivLabel3 = UILabel()
   
   
   let FirstLabel = UILabel()
   let SecondLabel = UILabel()
   let ThirdLabel = UILabel()
   let ForthLabel = UILabel()
   var Ffirst: Bool = false
   var Fsecond: Bool = false
   var Fthird: Bool = false
   var Ffourth: Bool = false
   
   let BackButton = UIButton()
   let ReLoadButton = UIButton()
   
   let EqualLabel = UILabel()
   let AnswerLabel = UILabel()
   let QuestionLabel = UILabel()
   var ExitQuestion: Bool = true
   
   var LabelArray: [String] = []
   
   var TestArray: [UILabel] = []
   
   var Num: [Int] = []
   
   let Speed: Double = 0.5
   var Answer = Int(arc4random_uniform(9) + 1)

   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.accessibilityIgnoresInvertColors = false
      view.backgroundColor = UIColor.white
      
      Answer = Int(arc4random_uniform(9) + 1)
      
      InitNumber()
      InitArithmeticButton()
      InitNumbreLabel()
      InitFormation()
      LabelArray = ["?", "=", AnswerLabel.text] as! [String]
      
      
   }
   
   
   
   
   
   @objc func ReLoad(){
      if ExitQuestion == false {
         AudioServicesPlaySystemSound(1522);
         AudioServicesPlaySystemSound(1520);
         return
      }
      AudioServicesPlaySystemSound(1522);
      AudioServicesPlaySystemSound(1520);
      loadView()
      viewDidLoad()
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
   
   func MoveCal(_ TargetLabel: UILabel) {
      TargetLabel.isHidden = false
      FormationUpLabel(Target: TargetLabel)
   }
   
   func CheckCanMove() -> Bool {
      if ExitQuestion == true || TestArray.count % 2 == 0 {
         return false
      }
      
      if LabelArray.count == 9 {
         return false
      }
      
      return true
   }
   
   @objc func TapAdd() {
      if CheckCanMove() == false {
         return
      }
      AddCount += 1
      Add.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.13) {
         self.Add.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
      
      switch AddCount {
      case 1:
         MoveCal(AddLabel)
      case 2:
         MoveCal(AddLabel2)
      case 3:
         MoveCal(AddLabel3)
      default:
         break
      }
   }
   @objc func TapSub() {
      if CheckCanMove() == false {
         return
      }
      SubCount += 1
      Sub.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Sub.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
      switch SubCount {
      case 1:
         MoveCal(SubLabel)
      case 2:
         MoveCal(SubLabel2)
      case 3:
         MoveCal(SubLabel3)
      default:
         break
      }
   }
   @objc func TapMul() {
      if CheckCanMove() == false {
         return
      }
      MulCount += 1
      Mul.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Mul.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
      switch MulCount {
      case 1:
         MoveCal(MulLabel)
      case 2:
         MoveCal(MulLabel2)
      case 3:
         MoveCal(MulLabel3)
      default:
         break
      }
   }
   @objc func TapDiv() {
      if CheckCanMove() == false {
         return
      }
      DivCount += 1
      Div.backgroundColor = UIColor.cyan
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
         self.Div.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
      }
      switch DivCount {
      case 1:
         MoveCal(DivLabel)
      case 2:
         MoveCal(DivLabel2)
      case 3:
         MoveCal(DivLabel3)
      default:
         break
      }
   }
   
   func CalCal() {
      
      let SerchEqurl = LabelArray.index(of: "=")
      let FrontOfEqurl = SerchEqurl! - 1
      
      print("FrontFoEqurl -> \(FrontOfEqurl)")
      
      if FrontOfEqurl % 2 == 1 {
         print("Dont Cal Case1")
         AudioServicesPlaySystemSound(1522);
         AudioServicesPlaySystemSound(1520);
         return
      }
      
      if FrontOfEqurl == 0 {
         print("Dont Cal Case2")
         AudioServicesPlaySystemSound(1522);
         AudioServicesPlaySystemSound(1520);
         return
      }
      
      var YourAnswer = Int(LabelArray[0])!
      print("\nYourAnswer = \(YourAnswer)\n")
      
      for Tmp in stride(from: 2, to: FrontOfEqurl + 1, by: 2) {
         let AnsTmp = Int(LabelArray[Tmp])!
         
         switch LabelArray[Tmp - 1] {
         case "+":
            YourAnswer = YourAnswer + AnsTmp
         case "-":
            YourAnswer = YourAnswer - AnsTmp
         case "*":
            YourAnswer = YourAnswer * AnsTmp
         case "/":
            if AnsTmp == 0 {
               print("Dont Cal Case3")
               return
            }
            YourAnswer = YourAnswer / AnsTmp
         default:
            print("Dont Cal Case4")
            return
         }
         print("Now Ans is \(YourAnswer)")
      }
      
      if YourAnswer != Answer {
         AudioServicesPlaySystemSound(1522);
         AudioServicesPlaySystemSound(1520);
         return
      }
      
      if YourAnswer == Answer {
         print("\nCOMPLEATE\n")
         AudioServicesPlaySystemSound(1518);
         AudioServicesPlaySystemSound(1521);
         BackButton.isEnabled = false
         DispatchQueue.main.asyncAfter(deadline: .now() + Speed / 3){
            self.CompEarchAnimation(self.TestArray.count, self.TestArray.count, self.TestArray[0].frame.minX, self.TestArray[0].frame.minY, self.TestArray[0].frame.width)
            self.GameSet()
         }
         return
      }
   }
   
   

   func BackFormation() {
      
      let ArrayCount = CGFloat(LabelArray.count + 1)
      
      if ArrayCount == 3 {
         return
      }
      
      let Wide = Size.width / ArrayCount
      let Interval = Size.width / (ArrayCount * ArrayCount)
      
      
      
      UILabel.transition(with: EqualLabel, duration: Speed, options: .curveEaseInOut, animations: { () -> Void in
         
         //Target.frame = CGRect(x: Interval * (Count - 2) + Wide * (Count - 3), y: self.Size.height / 4, width: Wide, height: Wide)
         self.EqualLabel.frame = CGRect(x: Interval * (ArrayCount - 2) + Wide * (ArrayCount - 3), y: self.Size.height / 4, width: Wide, height: Wide)
         self.AnswerLabel.frame = CGRect(x: Interval * (ArrayCount - 1) + Wide * (ArrayCount - 2), y: self.Size.height / 4, width: Wide, height: Wide)
         
         
      }, completion: { _ in
         //ここを入れると。無限ループする。
         //self.FormationUpLabel(Target: Target)
      })
      
      
   }
   
   func FrontFormation(Count:Int) {
      
      var ArrayCount = CGFloat(LabelArray.count + 1)
      let Wide = Size.width / ArrayCount
      let Interval = Size.width / (ArrayCount * ArrayCount)
      ArrayCount = CGFloat(LabelArray.count)
      
      for Tmp in 0 ... (Count - 1) {
         UILabel.transition(with: TestArray[Tmp], duration: Speed, options: .curveEaseInOut, animations: { () -> Void in
            
            self.TestArray[Tmp].frame = CGRect(x: Interval * CGFloat(Tmp + 1) + Wide * CGFloat(Tmp), y: self.Size.height / 4, width: Wide, height: Wide)
         }, completion: { _ in
            //ここを入れると。無限ループする。
            //self.FormationUpLabel(Target: Target)
         })
      }
      
   }
   
   func ReSetBool(Num: Int){
      
      switch Num {
      case 1:
         Ffirst = false
      case 2:
         Fsecond = false
      case 3:
         Fthird = false
      case 4:
         Ffourth = false
      default:
         break
      }
   }
   
   func ReFormCalCount(_ Check: String) {
      
      switch Check {
      case "+":
         AddCount -= 1
      case "-":
         SubCount -= 1
      case "*":
         MulCount -= 1
      case "/":
         DivCount -= 1
      default:
         print("error")
         break
      }
   }
   
   
   func NumbreOrCla(_ Num: Int) -> Bool {
      
      if Num < 10 {
         return false
      }else{
         return true
      }
      
   }
   
   @objc func FormationOneBackLabel() {
      
      if ExitQuestion == true {
         return
      }
      
      let SerchEqurl = LabelArray.index(of: "=")
      let FrontOfEqurl = SerchEqurl! - 1
      
      let Target: UILabel = TestArray[FrontOfEqurl]
      var Count = CGFloat(TestArray[FrontOfEqurl].tag)
      let Wide = Size.width / 5
      let Interval = Size.width / 25
      
      ReSetBool(Num: TestArray[FrontOfEqurl].tag)
      
      
      //+ - * /
      if NumbreOrCla(TestArray[FrontOfEqurl].tag) == true {
         Count -= 10
         UILabel.transition(with: Target, duration: Speed, options: .curveEaseInOut, animations: { () -> Void in
            Target.frame = CGRect(x: Interval * Count + Wide * (Count - 1) + Wide / 2, y: self.Size.height * 3 / 4 + Wide / 2, width: 0.1, height: 0.1)
            
         }, completion: { _ in
            //self.FormationUpLabel(Target: Target)
         })
         
         ReFormCalCount(LabelArray[FrontOfEqurl])
      }else{
         UILabel.transition(with: Target, duration: Speed, options: .curveEaseInOut, animations: { () -> Void in
            Target.frame = CGRect(x: Interval * Count + Wide * (Count - 1), y: self.Size.height * 2 / 4, width: Wide, height: Wide)
         }, completion: { _ in
            //self.FormationUpLabel(Target: Target)
         })
      }
      
      TestArray.remove(at: FrontOfEqurl)
      LabelArray.remove(at: FrontOfEqurl)

      BackFormation()
      if FrontOfEqurl != 0{
         FrontFormation(Count: FrontOfEqurl)
      }
      
      //？を復活させる
      if LabelArray[0] == "=" {
         ExitQuestion = true
         LabelArray.insert("?", at: 0)
         UILabel.transition(with: Target, duration: Speed, options: .curveEaseInOut, animations: { () -> Void in
            self.QuestionLabel.frame = CGRect(x: self.Size.width / 16 , y: self.Size.height / 4, width: self.Size.width / 4, height: self.Size.width / 4)
         }, completion: {_ in})
         
      }
      
      print(LabelArray)
      AudioServicesPlaySystemSound(1524);
      AudioServicesPlaySystemSound(1520);
      return
      
      
   }
   
   
   //選択されたラベルを動的に移動させる。
   func FormationUpLabel(Target:UILabel) {
      
      //？があるかないかで場合分け
      if ExitQuestion == true {
         //?を取り除く
         LabelArray.removeFirst()
         LabelArray.insert(Target.text!, at: 0)
         TestArray.append(Target)
         ExitQuestion = false
         UILabel.transition(with: Target, duration: Speed, options: .curveEaseInOut, animations: { () -> Void in
            self.QuestionLabel.frame = CGRect(x: self.Size.width * 3 / 16 , y: self.Size.height / 4 + self.Size.width / 8, width: 0.3, height: 0.3)
         }, completion: {_ in})

      }else{
         let SerchEqurl = LabelArray.index(of: "=")
         let FrontOfEqurl = SerchEqurl!
         LabelArray.insert(Target.text!, at: FrontOfEqurl)
         TestArray.append(Target)
         FrontFormation(Count: FrontOfEqurl)
      }
      
      let ArrayCount = CGFloat(LabelArray.count + 1)
      let Wide = Size.width / ArrayCount
      let Interval = Size.width / (ArrayCount * ArrayCount)
      
      let Count = CGFloat(LabelArray.count)
      
      
      
      UILabel.transition(with: Target, duration: Speed, options: .curveEaseInOut, animations: { () -> Void in

         Target.frame = CGRect(x: Interval * (Count - 2) + Wide * (Count - 3), y: self.Size.height / 4, width: Wide, height: Wide)
         self.EqualLabel.frame = CGRect(x: Interval * (Count - 1) + Wide * (Count - 2), y: self.Size.height / 4, width: Wide, height: Wide)
         self.AnswerLabel.frame = CGRect(x: Interval * Count + Wide * (Count - 1), y: self.Size.height / 4, width: Wide, height: Wide)
         
         
      }, completion: { _ in
         //self.FormationUpLabel(Target: Target)
      })
      
      print(LabelArray)
      
      //計算をする
      CalCal()
   }
   
   
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
      for touch: AnyObject in touches {
         let touched: UITouch = touch as! UITouch
         
         switch touched.view {
         case FirstLabel:
            if (Ffirst == false && LabelArray.count % 2 == 0) || ExitQuestion == true {
               FormationUpLabel(Target: FirstLabel)
               Ffirst = true
            }
            
         case SecondLabel:
            if (Fsecond == false && LabelArray.count % 2 == 0) || ExitQuestion == true {
               FormationUpLabel(Target: SecondLabel)
               Fsecond = true
            }
            
         case ThirdLabel:
            if (Fthird == false && LabelArray.count % 2 == 0) || ExitQuestion == true {
               FormationUpLabel(Target: ThirdLabel)
               Fthird = true
            }
            
         case ForthLabel:
            if (Ffourth == false && LabelArray.count % 2 == 0) || ExitQuestion == true {
               FormationUpLabel(Target: ForthLabel)
               Ffourth = true
            }
         default:
            break
         }
      }
   }
   
   
   func CompEarchAnimation(_ Count: Int, _ Tmp: Int, _ X: CGFloat, _ Y: CGFloat, _ Wide: CGFloat) {

         
      UILabel.transition(with: self.TestArray[Count - Tmp], duration: self.Speed / 4, options: .curveEaseInOut, animations: { () -> Void in
         self.TestArray[Count - Tmp].frame = CGRect(x: X , y: Y - Wide / 2, width: Wide, height: Wide)
      }, completion: {(finished: Bool) in
               
         UILabel.transition(with: self.TestArray[Count - Tmp], duration: self.Speed / 4, options: .curveEaseInOut, animations: { () -> Void in
            self.TestArray[Count - Tmp].frame = CGRect(x: X , y: Y, width: Wide, height: Wide)
         }, completion: {(finished: Bool) in
            print("Tmp = \(Tmp)")
            if Tmp == 1 {
               self.BackButton.isEnabled = true
               return
            }
            self.CompEarchAnimation(Count, Tmp - 1, self.TestArray[Count - Tmp + 1].frame.minX, Y, Wide)
            
                  
         })
      })

      
      
   }
   
   func GameSet() {
      print("GameSet")
      return
   }
   

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}
