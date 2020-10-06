//
//  NetworkManagerProtocol.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 30.09.2020.
//

import Foundation

let successHTTPCodesRange = 200...299
typealias NetworkParameters = [String: AnyHashable]
typealias NetworkHTTPHeaders = [String: String]

enum NetworkHTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case connect = "CONNECT"
}

enum Encoding: Int {
    case URL
    case JSON
    case queryString
}

enum NetworkResponse {
    case success(Data)
    case error(String)
    case failure(String)
}

struct ErrorsResponse {
    var errorsData: Data?
    var httpCode: Int?
    var requestKey: String?
    
    init(_ errorsData: Data?, _ httpCode: Int?, _ requestKey: String?) {
        self.errorsData = errorsData
        self.httpCode = httpCode
        self.requestKey = requestKey
    }
    
    init(errorsData: Data?, httpCode: Int?) {
        self.errorsData = errorsData
        self.httpCode = httpCode
    }
    
    func append(requestKey: String?) -> ErrorsResponse {
        return ErrorsResponse(self.errorsData, self.httpCode, requestKey)
    }
    
    func debugDescription() -> String {
        return "ErrorsResponse: requestKey - \(requestKey ?? "nil"), httpCode - \(String(describing: httpCode))"
    }
}

protocol NetworkManagerProtocol: class {
    
    func makeRequest(url: URL,
                     httpMethod: NetworkHTTPMethod,
                     encoding: Encoding,
                     requestParameters: NetworkParameters?,
                     requestHeaders: NetworkHTTPHeaders?,
                     responseHandler: @escaping (NetworkResponse) -> Void)
}

enum Result<T, E> {
    case success(T)
    case failure(E)
    
    var error: E? {
        if case let .failure(error) = self {
            return error
        }
        return nil
    }
    
    var value: T? {
        if case let .success(value) = self {
            return value
        }
        return nil
    }
}

typealias GeneralNetworkComplition<R, E> = (Result<R, E>) -> Void
typealias GeneralCompletion<R> = (Result<R, Error?>) -> Void
typealias GeneralVoidCompletion = (Result<Void, Error>) -> Void
