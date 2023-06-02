//
//  APICallerTests.swift
//  SportsHubTests
//
//  Created by Yousra Mamdouh Ali on 01/06/2023.
//

import XCTest
@testable import SportsHub

final class APICallerTests: XCTestCase {
    
    override func setUp() {

    }
    
    override func tearDown() {

    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
    func testGetLeagues()
    {
        let myExpectation = expectation(description: "waiting for the API")
        APICaller.getLeagues(param: "tennis")
        {
            items in
            guard let items = items else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            
            XCTAssertGreaterThan(items.result?.count ?? 0, 0, "Array is Empty")
            //XCTAssertEqual(items.count, 0, "Array is not Empty")
            myExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 6, handler: nil)
    }
    
    func testGetUpcomingEvents()
    {
        let myExpectation = expectation(description: "waiting for the API")
        APICaller.getUpcomingEvents(sportName: "basketball", leagueId: 1098)
        {
            items in
            guard let items = items.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(items.count, 0, "Array is Empty")
            XCTAssertEqual(items.count,104, "Data didn't match")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout:10, handler: nil)
    }
    
    
    func testGetLatestEvents()
    {
        let myExpectation = expectation(description: "waiting for the API")
        APICaller.getLatestEvents(sportName: "cricket", leagueId: 733)
        {
            items in
            guard let items = items.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            //38
            XCTAssertGreaterThan(items.count, 0, "Array is Empty")
            XCTAssertEqual(items.count,38, "Data didn't match")
            myExpectation.fulfill()
            
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    func testGetTeams()
    {
        let myExpectation = expectation(description: "waiting for the API")
        APICaller.getTeams(sportName: "football", leagueId: 152)
        {
            items in
            guard let items = items.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(items.count, 0, "Array is Empty")
            XCTAssertEqual(items.count,20, "Data didn't match")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 6, handler: nil)
    }
    
    func testGetFootballTeamDetails()
    {
        let myExpectation = expectation(description: "waiting for the API")
        APICaller.getFootballTeamDetails(teamId: 80)
        {
            items in
            guard let items = items.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(items.count, 0, "Array is Empty")
            XCTAssertEqual(items.count,1, "Data didn't match ")
            XCTAssertEqual(items[0].team_name, "Manchester City","Data didn't match")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 6, handler: nil)
    }
}
