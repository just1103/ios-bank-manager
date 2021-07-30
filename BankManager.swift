//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let processingTime: Double = 0.7
    
    func serve(_ customer: Customer, completion: (Double) -> Void) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(customer.waitingNumber)번 고객 업무 완료")
        completion(processingTime)
    }
}

struct Customer {
    let waitingNumber: Int
}

struct Bank {
    private var customerQueue: Queue<Customer>
    private var manager: BankManager = BankManager()
    private var customerCount: Int = 0
    private var totalTime: Double = 0
    
    func open() {
        
    }
    
    func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
