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
        }.bindTo(tableView.rx_itemsWithCellIdentifier("CellIdentifier"))
            {(_, item, cell:UITableViewCell) in
                cell.textLabel!.text = item.title
        }.addDisposableTo(disposeBag)
    }
}