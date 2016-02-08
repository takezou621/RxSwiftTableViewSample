//
//  QiitaAPI.swift
//  RxSwiftTableViewSample
//
//  Created by KawaiTakeshi on 2016/02/08.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper

protocol QiitaAPI: RequestType {
}

extension QiitaAPI {
    var baseURL: NSURL {
        return NSURL(string: "https://qiita.com/api/v2/")!
    }
}

struct GetItems: QiitaAPI {
    typealias Response = [Article]
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "items"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        if let items = Mapper<Article>().mapArray(object) {
            return items
        }
        return nil
    }
}
