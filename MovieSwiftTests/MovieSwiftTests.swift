//
//  MovieSwiftTests.swift
//  MovieSwiftTests
//
//  Created by Arun Kumar on 9/29/18.
//  Copyright © 2018 Arun Kumar. All rights reserved.
//

import XCTest
@testable import MovieSwift

class MovieSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testApi(){
        
       let apiHandler = ApiHandler()
        apiHandler.getMoviesList(url: BaseUrl.endPoint)
        
    }
//    func testTable(){
//
//        let objMovie = Movie(title: <#T##String#>, popularity: <#T##Double#>, release_date: <#T##String#>, poster_path: <#T##String?#>)
//
//        let arr  = [objMovie]
//        let movie = MovieTableSourceDelegateHandler(param: arr)
//        XCTAssertNil(movie,"ksdcs")
//
//        assert(arr.count == movie.arrMovies?.count)
//    }
    
}
