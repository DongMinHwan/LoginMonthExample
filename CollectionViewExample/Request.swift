//
//  File.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/07.
//

import Foundation
import Alamofire


class Request {
    
    
    static var baseUrl : String {
        get {
            
            
            return Constant.API.url
        }
    }
    static private func handleError(_ response: DataResponse<Any, AFError>) -> ErrorModel? {
        if let result = response.data {

            if let error = try? JSONDecoder().decode(ErrorModel.self, from: result) {
                

                return error
            }
      
        }
        
        return nil
    }
    
    static func gets(route: String, param: Parameters, completion: @escaping (_ data: Data?) -> Void, exception: @escaping (_ error: ErrorModel) -> Void = { error in }) {
        
        var url: String
        url = route
        print("url: \(url)")
        // 여기서는 따로 해더 값이 없기 때문
        //https://www.googleapis.com/books/v1/volumes?q=Herry%20potter
        let alamo = AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate(statusCode: 200..<300)
        alamo.responseJSON { [self] response in
           
            
            switch response.result {
                case .success:
                completion(response.data)
                 
                    return

                default:
                    if let error = handleError(response) {
                        exception(error)
                    }
                return
            }
        }
    }
}
