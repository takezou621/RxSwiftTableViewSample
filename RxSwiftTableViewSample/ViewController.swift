//
//  ViewController.swift
//  RxSwiftTableViewSample
//
//  Created by KawaiTakeshi on 2016/02/08.
//  Copyright © 2016年 Takeshi Kawai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        bind()
        viewModel.fetch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bind() {
        viewModel.items.asObservable()
            .filter { items in
                return !items.isEmpty
            }.bindTo(tableView.rx_itemsWithCellFactory){
                (tv,i,vm) in
                let indexPath = NSIndexPath(forItem: i, inSection: 0)
                let article:Article = self.viewModel.items.value[i]
                //　Type振り分けの挙動確認用に記事タイトルが30文字以上の場合はLARGEそれ以外はSMALLとする
                let type:ArticleType = article.title.characters.count > 30 ? .VARIABLE : .FIXED
                
                let factory = ArticleCellFactory()
                let cell = factory.cellCreate(article,type: type, tableView: tv, indexPath: indexPath)
                return cell as! UITableViewCell
        }.addDisposableTo(disposeBag)
    }
}