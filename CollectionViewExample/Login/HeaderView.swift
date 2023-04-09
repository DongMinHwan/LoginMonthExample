//
//  LoginHeaderView.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import UIKit
import Then
import SnapKit

class HeaderView : UIView {
    
    let main = UIView()
    let backBtn = UIButton().then {
        $0.backgroundColor = .red
    }
    let headerTitle = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setlayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setlayout()
    }
    
    func setup() {
        addSubview(main)
        main.addSubview(backBtn)
        main.addSubview(headerTitle)
    }
    func setlayout() {
        main.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(22)
        }
        
        headerTitle.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(24)
//            make.width.equalTo(70)
        }
     }
 
}
