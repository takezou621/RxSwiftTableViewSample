//
//  ArticleCellProtocol.swift
//  RxSwiftTableViewSample
//
//  Created by KawaiTakeshi on 2016/02/08.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol ArticleCellProtocol {
    var size:ArticleType {get set}
    var title:Variable<String> {get set}
}

extension ArticleCellProtocol where Self:UITableViewCell{
    func showSize(type:ArticleType) {
    }
    
}
