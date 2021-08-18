//
//  ChampionSwiftTests.swift
//  ChampionSwiftTests
//
//  Created by saeed on 7/28/21.
//

import XCTest
@testable import ChampionSwift

class ChampionSwiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLeagueMoc() {
        XCTAssertNoThrow(League.moc())
    }
    
    func testStandingMoc() {
        XCTAssertNoThrow(Standing.moc())
    }
    
    func testFixtureMoc() {
        print(Fixture.moc().date)
        print(Fixture.moc().timestamp)
        XCTAssertNoThrow(Fixture.moc())
    }
    
    
    func testMatchMoc() {
        XCTAssertNoThrow(Match.moc())
    }
    func testNextAndPreviousMonth() {
        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: Date())
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let newDate = dateFormatter.date(from: "\(nextMonth!)")
        print(newDate!)
    
    }

}
