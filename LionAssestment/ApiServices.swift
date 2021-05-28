//
//  ApiServices.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire

protocol ApiServiceProtocol {
    func getString(path: String) -> Single<(Bool, String)>
}

class ApiService: ApiServiceProtocol {

    private let configuration = URLSessionConfiguration.default
    private static let URL = "https://deezerdevs-deezer.p.rapidapi.com/"
    private static let successResponseCode = 200
    
    func getString(path: String) -> Single<(Bool, String)> {
        return doRequest(path: path, method: .get)
    }
    
    private func createURL(path: String) -> String {
        return ApiService.URL + path
    }
    
    private func populateHeaders(dict: [String:String]? = nil) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "x-rapidapi-key", value: "e10b0a11afmsh6d7bc9dc99a6600p1d9e80jsn5452c06b798c"))
        headers.add(HTTPHeader(name: "x-rapidapi-host", value: "deezerdevs-deezer.p.rapidapi.com"))
        
        if let dict = dict {
            for (k, v) in dict where !k.isEmpty {
                headers.add(HTTPHeader(name: k, value: v))
            }
        }
        
        return headers
    }
    
    private func doRequest(path: String, method: Alamofire.HTTPMethod) -> Single<(Bool, String)> {
        let manager = Session.default
        return Single.create { [weak self] single in
            guard let weakSelf = self else { return Disposables.create() }
            return manager.rx.request(method, weakSelf.createURL(path: path), encoding: URLEncoding.default, headers: weakSelf.populateHeaders(), interceptor: nil)
                .flatMap { alamofireRequest in
                    alamofireRequest.rx.responseString()
            }.subscribe(onNext: { (response, string) in
                single(.success((response.statusCode == ApiService.successResponseCode, string)))
            }, onError: { error in
                single(.failure(error))
            })
        }
    }
    
}
