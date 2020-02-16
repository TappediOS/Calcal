//
//  ExMainVC_Cal.swift
//  Calcal
//
//  Created by jun on 2020/02/16.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation

extension MainViewController {
   //正しく計算ができるかを出力する。
   func isCalRight() -> Bool {
      for z in 1 ... 4 {
         for x in 0 ... 3 {
            for y in 0 ... 3 {
               if x == y {
                  continue
               }
               switch z {
               case 1:
                  if Num[x] + Num[y] == Answer {
                     print("Num[\(x)](\(Num[x])) + Num[\(y)](\(Num[y])) is OK")
                  }
               case 2:
                  if Num[x] - Num[y] == Answer {
                     print("Num[\(x)](\(Num[x])) - Num[\(y)](\(Num[y])) is OK")
                  }
               case 3:
                  if Num[x] * Num[y] == Answer {
                     print("Num[\(x)](\(Num[x])) * Num[\(y)](\(Num[y])) is OK")
                  }
               case 4:
                  if Num[x] / Num[y] == Answer {
                     print("Num[\(x)](\(Num[x])) / Num[\(y)](\(Num[y])) is OK")
                  }
               default:
                  print("z error")
                  break
               }
            }
         }
      }
      
      for w in 1 ... 16 {
         for x in 0 ... 3 {
            for y in 0 ... 3 {
               for z in 0 ... 3 {
                  if x == y || x == z || y == z {
                     continue
                  }
                  switch w {
                  case 1:
                     if Num[x] + Num[y] + Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) + Num[\(y)](\(Num[y])) + Num[\(z)](\(Num[z])) is OK")
                     }
                  case 2:
                     if Num[x] + Num[y] - Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) + Num[\(y)](\(Num[y])) - Num[\(z)](\(Num[z])) is OK")
                     }
                  case 3:
                     if Num[x] + Num[y] * Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) + Num[\(y)](\(Num[y])) * Num[\(z)](\(Num[z])) is OK")
                     }
                  case 4:
                     if Num[x] + Num[y] / Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) + Num[\(y)](\(Num[y])) / Num[\(z)](\(Num[z])) is OK")
                     }
                  case 5:
                     if Num[x] - Num[y] + Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) - Num[\(y)](\(Num[y])) + Num[\(z)](\(Num[z])) is OK")
                     }
                  case 6:
                     if Num[x] - Num[y] - Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) - Num[\(y)](\(Num[y])) - Num[\(z)](\(Num[z])) is OK")
                     }
                  case 7:
                     if Num[x] - Num[y] * Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) - Num[\(y)](\(Num[y])) * Num[\(z)](\(Num[z])) is OK")
                     }
                  case 8:
                     if Num[x] - Num[y] / Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) - Num[\(y)](\(Num[y])) / Num[\(z)](\(Num[z])) is OK")
                     }
                  case 9:
                     if Num[x] * Num[y] + Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) * Num[\(y)](\(Num[y])) + Num[\(z)](\(Num[z])) is OK")
                     }
                  case 10:
                     if Num[x] * Num[y] - Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) * Num[\(y)](\(Num[y])) - Num[\(z)](\(Num[z])) is OK")
                     }
                  case 11:
                     if Num[x] * Num[y] * Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) * Num[\(y)](\(Num[y])) * Num[\(z)](\(Num[z])) is OK")
                     }
                  case 12:
                     if Num[x] * Num[y] / Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) * Num[\(y)](\(Num[y])) / Num[\(z)](\(Num[z])) is OK")
                     }
                  case 13:
                     if Num[x] / Num[y] + Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) / Num[\(y)](\(Num[y])) + Num[\(z)](\(Num[z])) is OK")
                     }
                  case 14:
                     if Num[x] / Num[y] - Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) / Num[\(y)](\(Num[y])) - Num[\(z)](\(Num[z])) is OK")
                     }
                  case 15:
                     if Num[x] / Num[y] * Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) / Num[\(y)](\(Num[y])) * Num[\(z)](\(Num[z])) is OK")
                     }
                  case 16:
                     if Num[x] / Num[y] / Num[z] == Answer {
                        print("Num[\(x)](\(Num[x])) / Num[\(y)](\(Num[y])) / Num[\(z)](\(Num[z])) is OK")
                     }
                  default:
                     print("w error")
                     break;
                     
                  }
               }
            }
         }
      }
      return false
   }
}
