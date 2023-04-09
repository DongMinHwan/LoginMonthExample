//
//  LoginView.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import UIKit
import SnapKit
import Then


class LoginView : UIView {

    let main = UIView().then {
        $0.backgroundColor = .black
    }
    //MARK: qpickerLoginStart
    let startLabel = UILabel().then {
        $0.text = "큐피커 시작하기"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
    }
    //MARK: - LoginBtn
    let loginBtn = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .blue
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    //MARK: - creteLabel
    let createLabel = UILabel().then {
        $0.text = "가볍게 시작하는 취향 디깅"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
    }
    //MARK: - 계정만들기
    let idCreateBtn = UIButton() .then {
        $0.backgroundColor = .gray
        $0.setTitle("계정만들기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //$0.titleLabel?.font = UIFont(name: "NanumSquareRound", size: 16)
    }
    
    let idfindLabel = UILabel().then {
        $0.text = "계정을 잊으셨나요? 계정찾기"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12)
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
        main.addSubview(startLabel)
        main.addSubview(loginBtn)
        main.addSubview(createLabel)
        main.addSubview(idfindLabel)
        main.addSubview(idCreateBtn)
        
    }
    
    func setlayout() {
      
        
        main.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        startLabel.snp.makeConstraints { make in
            make.left.right.equalTo(loginBtn)
            make.bottom.equalTo(loginBtn.snp.top).offset(-20)
            make.height.equalTo(21)
            
        }
        loginBtn.snp.makeConstraints { make in
            make.left.right.equalTo(createLabel)
            make.bottom.equalTo(createLabel.snp.top).offset(-64)
            make.height.equalTo(60)
        }
        createLabel.snp.makeConstraints { make in
            
            make.left.right.equalTo(idCreateBtn)
            make.height.equalTo(21)
            make.bottom.equalTo(idCreateBtn.snp.top).offset(-20)
            
        }
        idCreateBtn.snp.makeConstraints { make in
            make.left.right.equalTo(idfindLabel)
            make.bottom.equalTo(idfindLabel.snp.top).offset(-16)
            make.height.equalTo(60)
        }
        
        idfindLabel.snp.makeConstraints { make in

            make.bottom.equalToSuperview().offset(-50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(14)
        }
        
        
    }
    
}
