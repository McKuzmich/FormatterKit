//
//  TimeIntervalFormatterTests.swift
//  Tests-Russian
//
//  Created by Victor Ilyukevich on 4/25/16.
//  Copyright © 2016. All rights reserved.
//

import XCTest
import FormatterKit

class TTTTimeIntervalFormatterTests: XCTestCase {
    var formatter: TTTTimeIntervalFormatter!

    override func setUp() {
        super.setUp()
        formatter = TTTTimeIntervalFormatter()
    }

    // MARK: Tests

    func testStandardPast() {
        XCTAssertEqual(formatter.string(forTimeInterval: -1), "1 секунду назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -100), "1 минуту назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000), "2 часа назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -100000), "1 день назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -200000), "2 дня назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000000), "3 месяца назад")
    }

    func testStandardFuture() {
        XCTAssertEqual(formatter.string(forTimeInterval: 1), "1 секунду через")
        XCTAssertEqual(formatter.string(forTimeInterval: 100), "1 минуту через")
        XCTAssertEqual(formatter.string(forTimeInterval: 10000), "2 часа через")
        XCTAssertEqual(formatter.string(forTimeInterval: 100000), "1 день через")
        XCTAssertEqual(formatter.string(forTimeInterval: 200000), "2 дня через")
        XCTAssertEqual(formatter.string(forTimeInterval: 10000000), "3 месяца через")
    }

    func testIdiomaticPast() {
        formatter.usesIdiomaticDeicticExpressions = true

        XCTAssertEqual(formatter.string(forTimeInterval: -1), "1 секунду назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -100), "1 минуту назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000), "2 часа назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -100000), "1 день назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -200000), "2 дня назад")
        XCTAssertEqual(formatter.string(forTimeInterval: -10000000), "3 месяца назад")
    }

}
