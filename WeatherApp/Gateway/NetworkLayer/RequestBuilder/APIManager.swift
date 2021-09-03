//
//  APIManager.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//

import Foundation
//MARK:- URL Main request
protocol ApiRequest {
   
   var urlRequest: URLRequest { get }
   
}

//MARK:- Protocol Contains Method to generate Requests
protocol APIClient {
   
   typealias CallResponse<T> = ((Result<T, Error>) -> Void)

   func performRequest<T>(_ object: T.Type, router: ApiRequest,
                               responseHandler:@escaping CallResponse<T> ) where T: Decodable
   
}


/**  - performRequest Method responsible for generate API request
    - SessionManager property use for testing by inject mocking URLProtocol  or  nject  real  URLSession in the production code
*/
struct APIManager: APIClient {
   
   var sessionManager: URLSession
   
   init(session: URLSessionConfiguration = .default ) {
       
      self.sessionManager =  URLSession(configuration: session)
       
  }
   
   /*
    object: object that data we want parsing
    router: responable for inject url with all request paramters like method and encoding type.
    responseHandler: responable for return generica result type
    */
   func performRequest<T>(_ object: T.Type, router: ApiRequest, responseHandler: @escaping CallResponse<T>) where T : Decodable {
       
       let datatask =  sessionManager.dataTask(with: router.urlRequest) {  (data, response, error) in
           
            // Throw error if there is any http respones
    
           guard let UrlResponse = response as? HTTPURLResponse else {
               
                 DispatchQueue.main.async {
                   
                 responseHandler(.failure(NetworkRequestError(error: error)))
                   
                 }
               return
             }
           
           // If request Successfully called  will decode data
           
           let successRange = 200...299
           
           if successRange.contains(UrlResponse.statusCode) {
             
               do {
                   
                   let data = try JSONDecoder().decode(T.self, from: data!)
           
                       DispatchQueue.main.async {
                    
                         responseHandler(.success(data))
                           
                       }
                   
                    // if decoding proccess not Successfully decoded will throw an error
                   
                  } catch let error {
                   
                   DispatchQueue.main.async {
                       
                       responseHandler(.failure(ApiParseError(error: error, httpUrlResponse: UrlResponse, data: data)))
                       
                           }
                       }
           } else {
               
               // If request not  Successfully called  will throw an error
               DispatchQueue.main.async {
                   
                   responseHandler(.failure(ApiError(data: data, httpUrlResponse: UrlResponse)))
               }
            }
        }
       
       datatask.resume()
   }
   
}
