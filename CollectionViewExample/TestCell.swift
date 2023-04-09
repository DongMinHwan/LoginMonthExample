//
//  TestCell.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/07.
//

import UIKit
import SnapKit
import Then


class TestCell: UICollectionViewCell {
    
    static let registerId = "\(TestCell.self)"
    
    let main = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    let circleView = CircularView().then {
        $0.backgroundColor = .black
    }
    
    let dayLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10)
    }
    
    let dayLabel2 = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        addSubview(main)
        main.addSubview(circleView)
        circleView.addSubview(dayLabel)
        main.addSubview(dayLabel2)
        main.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        circleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.left.equalTo(11)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        dayLabel2.snp.makeConstraints { make in
            
            make.right.equalToSuperview().offset(-11)
            make.top.equalToSuperview().offset(17)
            make.width.equalTo(42)
            make.height.equalTo(14)
        }
    
        
    }
    
    func dateChange(_ i : String ,_ i2: String, _ i3:String,_ idex : Int) {
        print("i :ss \(i)")
        dayLabel.text = i
        dayLabel2.text = "\(i2), \(i3) "
        if idex == 0 {
            main.backgroundColor = .black
            circleView.backgroundColor = .white
            dayLabel.textColor = .black
            dayLabel2.textColor = .white
        }else {
            main.backgroundColor = .white
            circleView.backgroundColor = .black
            dayLabel.textColor = .white
            dayLabel2.textColor = .black
        }
    }
    
}
