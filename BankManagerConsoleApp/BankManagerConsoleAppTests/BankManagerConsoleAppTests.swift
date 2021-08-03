//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by 김태영 on 2021/07/28.
//
import XCTest

@testable import BankManagerConsoleApp


class BankManagerConsoleAppTests: XCTestCase {
    
    var sutQueue: LinkedListQueue<Int>!
    var sutList: LinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        sutQueue = LinkedListQueue()
        sutList = LinkedList()
    }
    
    // MARK: LinkedListQueue의 성공케이스 테스트 코드
    func test_enqueue_했을때_새로운_노드가_추가된다() {
        // given
        let value = 1
        // when
        sutQueue.enqueue(value: value)
        let result = sutQueue.peek
        // then
        XCTAssertEqual(value, result)
    }
    
    func test_dequeue_했을때_head의_값이_반환된다() {
        // given
        let value = 1
        sutQueue.enqueue(value: value)
        // when
        let result = sutQueue.dequeue()
        // then
        XCTAssertEqual(value, result)
    }
    
    func test_clear_했을때_큐의_head가_nil이된다() {
        // given
        let value = 1
        sutQueue.enqueue(value: value)
        // when
        sutQueue.clear()
        // then
        let result = sutQueue.peek
        XCTAssertEqual(result, nil)
    }
    
    func test_isEmpty_했을때_head에_값이_없을때_true다() {
        // given
        var result: Bool
        // when
        result = sutQueue.isEmpty()
        // then
        XCTAssertTrue(result)
    }
    
    // MARK: LinkedListQueue의 실패케이스 테스트 코드
    func test_enqueue_했을때_헤드가_nil이면_실패한다() {
        // given
        let value = 1
        // when
        sutQueue.enqueue(value: value)
        let result = sutQueue.peek
        // then
        XCTAssertNotEqual(nil, result)
    }
    
    func test_dequeue_했을때_head가_nil이면실패한다() {
        // given
        sutQueue.enqueue(value: 1)
        // when
        let result = sutQueue.dequeue()
        // then
        XCTAssertNotEqual(nil, result)
    }
    
    func test_clear_했을때_큐의_head가_nil이_아니면_실패한다() {
        // given
        let wrongResult = 1
        sutQueue.enqueue(value: 1)
        sutQueue.enqueue(value: 2)
        sutQueue.enqueue(value: 3)
        // when
        sutQueue.clear()
        // then
        let result = sutQueue.peek
        XCTAssertNotEqual(wrongResult, result)
    }
    
    func test_Queue에_값이있는경우_isEmpty_했을때_nil이면_실패한다() {
        // given
        sutQueue.enqueue(value: 1)
        // when
        let result = sutQueue.isEmpty()
        // then
        XCTAssertNotEqual(nil, result)
    }
    
    
    // MARK: LinkedList의 성공케이스 테스트 코드
    func test_headIsEmpty_했을때_head에_값이_없는_경우_true다() {
        // given
        var result: Bool
        // when
        result = sutList.headIsEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_headValue_했을때_head의_값을_반환한다() {
        // given
        let dummyValue = 1
        sutList.append(value: dummyValue)
        // when
        let result = sutList.headValue
        // then
        XCTAssertEqual(dummyValue, result)
    }
    
    func test_tailValue_했을때_tail의_값을_반환한다() {
        // given
        let dummyValue = 1
        sutList.append(value: dummyValue)
        // when
        let result = sutList.tailValue
        // then
        XCTAssertEqual(dummyValue, result)
    }
    
    func test_append_했을때_tail의_새로운_노드를_연결해준다() {
        // given
        let firstDummyValue = 1
        let secondDummyValue = 2
        // when
        sutList.append(value: firstDummyValue)
        sutList.append(value: secondDummyValue)
        let result = sutList.tailValue
        // then
        XCTAssertEqual(secondDummyValue, result)
    }
    
    func test_removeFirst_했을때_head의_값을_반환해준다() {
        // given
        sutList.append(value: 1)
        // when
        let result = sutList.removeFirst()
        // then
        XCTAssertEqual(1, result)
    }
    
    func test_removeFirst_했을때_head가_다음_노드로_바뀐다() {
        // given
        sutList.append(value: 1)
        sutList.append(value: 2)
        // when
        sutList.removeFirst()
        let result = sutList.headValue
        // then
        XCTAssertEqual(2, result)
    }
    
    func test_removeAll_했을때_head와_tail이_nil이_된다() {
        // given
        sutList.append(value: 1)
        sutList.append(value: 2)
        // when
        sutList.removeAll()
        let result: Bool = sutList.headValue == nil && sutList.tailValue == nil
        // then
        XCTAssertTrue(result)
        
    }
    
    // MARK: LinkedList의 실패케이스 테스트 코드
    func test_headIsEmpty_했을때_head에_값이_없는_경우_false면_실패한다() {
        // given
        var result: Bool
        // when
        result = sutList.headIsEmpty
        // then
        XCTAssertNotEqual(false, result)
    }
    
    func test_headValue에_1을_넣었는데_2가_반환되면_실패한다() {
        // given
        let dummyValue = 1
        sutList.append(value: dummyValue)
        // when
        let result = sutList.headValue
        // then
        XCTAssertNotEqual(2, result)
    }
    
    func test_tailValue에_1을_넣었는데_2가_반환되면_실패한다() {
        // given
        let dummyValue = 1
        sutList.append(value: dummyValue)
        // when
        let result = sutList.tailValue
        // then
        XCTAssertNotEqual(2, result)
    }
    
    func test_append_했을때_headIsEmpty_가_true면_실패한다() {
        // given
        sutList.append(value: 1)
        // when
        let result = sutList.headIsEmpty
        // then
        XCTAssertNotEqual(true, result)
    }
    
    func test_값이있는_노드에서_removeFirst_했을때_head의_값이_nil이면_실패한다() {
        // given
        sutList.append(value: 1)
        // when
        let result = sutList.removeFirst()
        // then
        XCTAssertNotEqual(nil, result)
    }
    
    func test_removeFirst_했을때_head가_다음_노드가_2가아니면_실패한다() {
        // given
        sutList.append(value: 1)
        sutList.append(value: 2)
        // when
        let result = sutList.removeFirst()
        // then
        XCTAssertNotEqual(2, result)
    }
    
    func test_removeAll_했을때_head와_tail이_nil이_아니면_실패한다() {
        // given
        sutList.append(value: 1)
        sutList.append(value: 2)
        // when
        sutList.removeAll()
        let result: Bool = sutList.headValue == nil && sutList.tailValue == nil
        // then
        XCTAssertNotEqual(false, result)
    }
}