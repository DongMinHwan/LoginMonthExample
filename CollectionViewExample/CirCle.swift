//
//  CirCle.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/07.
//

import UIKit
import SnapKit
import Then

class CircularView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.backgroundColor = .green
        
        self.then {
            $0.snp.makeConstraints {
                $0.width.equalTo(20)
                $0.height.equalTo(20)
            }
        }
    }
}
