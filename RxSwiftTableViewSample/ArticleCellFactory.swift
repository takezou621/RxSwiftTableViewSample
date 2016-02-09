//
//  ArticleCellFactory.swift
//  RxSwiftTableViewSample
//
//  Created by KawaiTakeshi on 2016/02/08.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import UIKit

enum ArticleType {
    case VARIABLE,FIXED
}

class ArticleCellFactory {
    func cellCreate(article:Article,type:ArticleType,tableView:UITableView,indexPath:NSIndexPath) -> ArticleCellProtocol {
        var cell:ArticleCellProtocol
        switch type {
        case .VARIABLE:
            let nib = UINib(nibName: "ArticleCellTypeVariable", bundle: nil)
            cell = nib.instantiateWithOwner(nil, options: nil)[0] as! ArticleCellTypeVariable
        case .FIXED:
            let nib = UINib(nibName: "ArticleCellTypeFixed", bundle: nil)
            cell = nib.instantiateWithOwner(nil, options: nil)[0] as! ArticleCellTypeFixed
        }
        cell.title.value = article.title
        return cell
    }
}
