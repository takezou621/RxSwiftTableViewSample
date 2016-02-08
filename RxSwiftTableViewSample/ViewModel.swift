//
//  ViewModel.swift
//  RxSwiftTableViewSample
//
//  Created by KawaiTakeshi on 2016/02/08.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import Foundation
import APIKit
import RxSwift
import RxCocoa

class ViewModel:NSObject {
    let disposeBag = DisposeBag()
    private(set) var items = Variable<[Article]>([])
    
    func fetch() {
        Session.rx_response(GetItems())
        .subscribeNext { items in
            self.items.value = items
        }.addDisposableTo(disposeBag)
    }
}
