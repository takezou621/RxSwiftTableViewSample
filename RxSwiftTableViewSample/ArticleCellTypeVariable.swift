//
//  ArticleCellTypeLarge.swift
//  RxSwiftTableViewSample
//
//  Created by KawaiTakeshi on 2016/02/08.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import UIKit
import RxSwift

class ArticleCellTypeVariable:UITableViewCell, ArticleCellProtocol{
    var size    = ArticleType.VARIABLE
    var title   = Variable<String>("")
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bind()
    }
    
    func bind() {
        title.asObservable()
        .bindTo(titleLabel.rx_text)
        .addDisposableTo(disposeBag)
    }
}
