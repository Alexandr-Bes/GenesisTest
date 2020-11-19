//
//  NetworkManager.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 30.09.2020.
//

import Foundation
import Alamofire
import RxAlamofire

class NetworkManager: NetworkManagerProtocol {
    
    func makeRequest(url: URL, httpMethod: NetworkHTTPMethod, encoding: Encoding, requestParameters: NetworkParameters?, requestHeaders: NetworkHTTPHeaders?, responseHandler: @escaping (NetworkResponse) -> Void) {
        
        var httpHeaders: HTTPHeaders? = nil
        if let tempHeader = requestHeaders {
            httpHeaders = HTTPHeaders(tempHeader)
        }
        
        let httpMethod = HTTPMethod(rawValue: httpMethod.rawValue)
        
        let urlEncoding: ParameterEncoding
        switch encoding {
        case .URL:
            urlEncoding = URLEncoding.default
        case .JSON:
            urlEncoding = JSONEncoding.default
        case .queryString:
            urlEncoding = URLEncoding.default
        }
    // TODO: - rx request
//        let se = Session.rx.request()
        
        AF.request(url, method: httpMethod, parameters: requestParameters, encoding: urlEncoding, headers: httpHeaders).response { (response) in
            responseHandler(response.serviceResponse)
        }
    }
    
}

extension Alamofire.DataResponse {
    var serviceResponse: NetworkResponse {
        
        // Print response
        if let responseData = data, let utf8Text = String(data: responseData, encoding: .utf8) {
            debugPrint("DataResponse: \(utf8Text)")
        }
        
        // Error
        if let message = error?.localizedDescription {
            return .failure(message)
        }
        
        guard let data = data,
            let httpCode = response?.statusCode else
        {
            return .failure("Did not receive Data response, or status code")
        }
        
        // success - responce
        if successHTTPCodesRange ~= httpCode {
            return .success(data)
        }
        
        // errors - responce
        return .error("Error code: \(httpCode)")
    }
}
