 //
//  TableViewCell.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class TableViewCel: UITableViewCell {
    
    static let registerId = "\(TestCell.self)"
    let main = UIView().then {
        $0.backgroundColor = .blue
    }
    let item = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15)
    }
    let price = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 15)
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()

        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = .zero
        self.layoutMargins = .zero
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
        
    }
    
    func setup() {
        addSubview(main)
        main.addSubview(item)
        main.addSubview(price)
        
        main.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        item.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        price.snp.makeConstraints { make in
            make.left.equalTo(item.snp.left)
            make.top.equalTo(item.snp.bottom).offset(0)
            make.bottom.equalToSuperview().offset(15)
        }
        
    }
    
}
