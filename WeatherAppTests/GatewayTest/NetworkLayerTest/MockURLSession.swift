//
//  MockURLSession.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
@testable import WeatherApp


class MockURLProtocol: URLProtocol{
    // property responsible handling mocking respones
    static var loadingHandler: ((URLRequest) -> (HTTPURLResponse, Data?, Error?))?

    //This method determines whether this protocol can handle the given request.
    override class func canInit(with request: URLRequest) -> Bool {
        
        return true
        
    }
//    This method returns the same request of the given  request.
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        
        return request
    }
    
    // This method Handling loading our logic which uses class property for returning appropriate response
    override func startLoading() {
        
        guard let handler = MockURLProtocol.loadingHandler else {
            
            assertionFailure("Received unexpected request with no handler set")
            
            return
            
        }
         // This tuple property Check if  is there data or will throw error
        
        let (response, data,error) =  handler(request)
     
        if let data = data {
            
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            
            client?.urlProtocol(self, didLoad: data)
            
            client?.urlProtocolDidFinishLoading(self)
            
        } else {
            
            client?.urlProtocol(self, didFailWithError: error!)
        }
        
        
    }
    
    
    override func stopLoading() {}
    
    /* This Method handling testing proccess
     @ statusCode : testing Status code
     @responseJSONData : testing data
     @ Error : testing error
    */
    static func respones (_ statusCode: Int?,_ responseJSONData: Data?, _ Error: Error?)
    {
        MockURLProtocol.loadingHandler = { request in
            
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: statusCode ?? 0,
                                           httpVersion: nil, headerFields:nil)!
            
            return (response, responseJSONData, Error)
        }
    }

}
  

