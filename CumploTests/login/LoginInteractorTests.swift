//
//  CumploTests.swift
//  CumploTests
//
//  Created by Gabriel Gárate Vivanco on 5/16/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import XCTest
@testable import Cumplo

class LoginInteractorTests: XCTestCase {
    
    var presenter : MockLoginPresenter!
    var interactor: LoginInteractor!
    var remote: MockLoginRemote!
    
    override func setUp() {
        super.setUp()
        
        self.remote = MockLoginRemote()
        self.presenter = MockLoginPresenter()
        self.interactor = LoginInteractor(remote: remote)
        self.interactor.presenter = presenter
    }
    override func tearDown() {
        super.tearDown()
        
        self.remote = nil
        self.presenter = nil
        self.interactor = nil
    }
    
    //MARK: - Mock
    class MockLoginRemote: LoginProtocolFetchInput {

        func login(_ request: LoginRequest, response: @escaping (UserEntity?, NSError?) -> (Void)) {
           
            response(UserEntity(), nil)
        }
    }
    class MockLoginPresenter: LoginProtocolInteractorOutput {
        
        //MARK: Test
        var isSuccess = false
        var error: NSError?
        
        //MARK: Interactor
        func scrollView(moveTo inset: UIEdgeInsets) {}
        
        func didRetrieve(user data: UserEntity) {
            isSuccess = true
        }
        func didRetrieve(alertWithTitle title: String, andMessage message: String) {
            isSuccess = false
            error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
        }
    }

    //MARK: - Test
    func testPassesCorrectData() {
        interactor.login(request: LoginRequest(email: "a@a.cl", password: "123456"))
        XCTAssertTrue(presenter.isSuccess)
        XCTAssertNil(presenter.error)
    }
}

