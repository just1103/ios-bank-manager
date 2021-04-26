//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Bank {
  var customers = [Customer]()
  var bankManagers = [BankManager]()
  var totalCompletedCustomer = 0
  var totalWorkedTime = 0.0
  var currentOrderNumber = 1
  
  init(numOfManagers: Int) {
    let randomNumber = Int.random(in: 10...30)
    for orderNumber in 1...randomNumber {
      customers.append(Customer(order: orderNumber))
    }
    
    for counterNumber in 1...numOfManagers {
      bankManagers.append(BankManager(counterNumber))
    }
  }
  
  func open() {
    var isRepeat = true
    
    repeat {
      if customers.isEmpty {
        isRepeat = false
      } else if customers.contains(Customer(order: currentOrderNumber)) {
        continue
      } else {
        work(order: currentOrderNumber)
        // FIXME: - 처리가 끝난 고객은 배열에서 제거해야 함
      }
    } while isRepeat
    
    close()
  }
  
  func work(order: Int) {
    let workingTime = 0.7

    print("\(order)번 고객 업무 시작")
    OperationQueue().addOperation {
      let unit = 1000000.0
      usleep(UInt32(workingTime * unit))
    }
    // TODO: - 비동기실험해야함
    
    print("\(order)번 고객 업무 완료")
    totalWorkedTime += workingTime
  }
  
  func close() {
    let complateString = """
    업무가 마감되었습니다.
    오늘 업무를 처리한 고객은 총 \(totalCompletedCustomer)명이며,
    총 업무 시간은 \(totalWorkedTime)초입니다.
    """
    print(complateString)
  }
}
