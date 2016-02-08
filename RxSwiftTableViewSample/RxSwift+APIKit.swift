//
//  RxSwift+APIKit.swift
//  mate
//
//  Created by KawaiTakeshi on 2016/01/21.
//  Copyright © 2016年 Kawai Takeshi. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

extension Session {
    public static func rx_response<T: RequestType>(request: T) -> Observable<T.Response> {
        return Observable.create { (observer:AnyObserver<T.Response>) -> Disposable in
            let task = sendRequest(request) { result in
                switch result {
                case .Success(let response):
                    observer.onNext(response)
                    observer.onCompleted()
                case .Failure(let error):
                    observer.onError(error)
                }
            }
            let t = task
            t?.resume()
            
            return AnonymousDisposable {
                task?.cancel()
            }
        }
    }
    
    func rx_sendRequest<T: RequestType>(request: T) -> Observable<T.Response> {
        return Observable.create { observer in
            let task = self.sendRequest(request) { result in
                switch result {
                case .Success(let res):
                    observer.on(.Next(res))
                    observer.on(.Completed)
                case .Failure(let err):
                    observer.onError(err)
                }
            }
            return AnonymousDisposable {
                task?.cancel()
            }
        }
    }
    
    class func rx_sendRequest<T: RequestType>(request: T) -> Observable<T.Response> {
        return sharedSession.rx_sendRequest(request)
    }

}