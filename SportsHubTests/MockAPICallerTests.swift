//
//  MockAPICallerTests.swift
//  SportsHubTests
//
//  Created by Yousra Mamdouh Ali on 02/06/2023.
//

import XCTest
@testable import SportsHub
final class MockAPICallerTests: XCTestCase {

    override func setUp() {
     
    }

    override func tearDown() {
    
    }

    // MARK: testing leagues
func testGetLeaguesShouldPass()
    {
        let networkManager = MockAPICaller(shouldReturnError: false)
        networkManager.getLeagues(url: ""){
            (items,error)
            in
            
            guard let items = items else
            {
                XCTFail()
                return
            }
            XCTAssertGreaterThan(items.count,0, "There is a response")
            XCTAssertEqual(items[0].league_name, "UEFA Europa League","Got response")
            
        }
    
    }

    func testGetEmployeesShouldFail()
    {
        let networkManager = MockAPICaller(shouldReturnError: true)
        networkManager.getLeagues (url: "", complitionHandler: {
            
            (items,error)
            in
            XCTAssertNil(items,"Empty response")
        })
    }
    
    
  // MARK: testing upComingEvents
    func testGetUpComingEventsShouldPass()
    {
        let networkManager = MockAPICaller(shouldReturnError: false)
        networkManager.getUpcomingEvents(url: ""){
            (items,error)
            in
            
            guard let items = items else
            {
                XCTFail()
                return
            }
            XCTAssertGreaterThan(items.count,0, "There is a response")
            XCTAssertEqual(items[0].event_time, "15:00","Got response")
            
        }
    }
    
    func testGetUpComingEventsShouldFail()
    {
        let networkManager = MockAPICaller(shouldReturnError: true)
        networkManager.getUpcomingEvents (url: "", complitionHandler: {
            
            (items,error)
            in
            XCTAssertNil(items,"Empty response")
        })
    }
    
    // MARK: testing latestEvents 
    func testGetLatestEventsShouldPass()
    {
        let networkManager = MockAPICaller(shouldReturnError: false)
        networkManager.getLatestEvents(url: ""){
            (items,error)
            in
            
            guard let items = items else
            {
                XCTFail()
                return
            }
            XCTAssertGreaterThan(items.count,0, "There is a response")
            XCTAssertEqual(items[0].event_time, "09:00","Got response")
            
        }
    }
    
    func testGetLatestEventsShouldFail()
    {
        let networkManager = MockAPICaller(shouldReturnError: true)
        networkManager.getLatestEvents (url: "", complitionHandler: {
            
            (items,error)
            in
            XCTAssertNil(items,"Empty response")
        })
    }
    
    //MARK: testing teams
    func testGetTeamsShouldPass()
    {
        let networkManager = MockAPICaller(shouldReturnError: false)
        networkManager.getTeams(url: ""){
            (items,error)
            in
            
            guard let items = items else
            {
                XCTFail()
                return
            }
            XCTAssertGreaterThan(items.count,0, "There is a response")
            XCTAssertEqual(items[0].team_key, 80,"Got response")
            XCTAssertEqual(items[1].team_name,"Liverpool","Got response")
            
        }
    }
    
    func testGetTeamsShouldFail()
    {
        let networkManager = MockAPICaller(shouldReturnError: true)
        networkManager.getTeams (url: "", complitionHandler: {
            
            (items,error)
            in
            XCTAssertNil(items,"Empty response")
        })
    }
    
    //MARK: testing football team details
   
    func testGetTeamDetailsShouldPass()
    {
        let networkManager = MockAPICaller(shouldReturnError: false)
        networkManager.getTeamDetails(url: ""){
            (items,error)
            in
            
            guard let items = items else
            {
                XCTFail()
                return
            }
            XCTAssertGreaterThan(items.count,0, "There is a response")
            XCTAssertEqual(items[0].team_name, "Manchester City","Got response")
            XCTAssertEqual(items[0].players?.count,26,"Got response")
            XCTAssertEqual(items[0].players?[0].player_name,"S.Ortega","Got response")
            
        }
    }
    
    func testGetTeamDetailsShouldFail()
    {
        let networkManager = MockAPICaller(shouldReturnError: true)
        networkManager.getTeamDetails (url: "", complitionHandler: {
            
            (items,error)
            in
            XCTAssertNil(items,"Empty response")
        })
    }
}
