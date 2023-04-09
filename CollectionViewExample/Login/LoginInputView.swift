//
//  LoginInputView.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class LoginInputView : UIView {
    
    
    let scrollView = UIScrollView()
    
    let contentView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let headerView = HeaderView()
    
    let phemailLabel = UILabel().then {
        $0.text = "휴대폰 번호 or 이메일 주소"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
    }

    let emailPhoneInputTextFiled = UITextField().then {
        let border = CALayer()
        $0.placeholder = "01012345678 or 이메일 주소"
        $0.layer.masksToBounds = false
        $0.leftViewMode = .always
        $0.borderStyle = .none
        $0.textAlignment = .left
        $0.textColor = UIColor.white
    }
    
    let idtextFiledUnderline = UIView().then {
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.borderWidth = 1
        $0.backgroundColor = .red
    }

    //MARK: - 비밀벊소 입력 변수명 이미지 넣기
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    let pwInputTextField = UITextField().then {
        
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.layer.masksToBounds = false
        $0.leftViewMode = .always
        $0.borderStyle = .none
        $0.textAlignment = .left
        $0.textColor = UIColor.white
        $0.isSecureTextEntry = true
    }
    
    let pwSecureBtn = UIButton().then {
        $0.backgroundColor = .red
    }
    
    let pwtextFiledUnderline = UIView().then {
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.borderWidth = 1
        $0.backgroundColor = .red
    }
    let loginBtn = UIButton().then {
        $0.backgroundColor = .gray
        $0.setTitle("로그인", for: .normal)
    }
    //MARK: - 비밀번호 안내 문구
    let pwGuideLabel = UILabel().then {
        $0.text = "비밀번호를 잊으셨나요? 비밀번호 재설정"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .white
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
        addSubview(headerView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        _ = [phemailLabel,emailPhoneInputTextFiled,idtextFiledUnderline,pwLabel,pwInputTextField,pwSecureBtn,pwtextFiledUnderline,pwGuideLabel,loginBtn].map {self.contentView.addSubview($0)}
    }
    
    func setlayout() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(24)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            //make.edges.equalToSuperview() // 스크롤뷰가 표현될 영역
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints {make in
              make.width.equalToSuperview()
              make.centerX.top.bottom.equalToSuperview()
        }
        
        phemailLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(241)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(17)
        }
        emailPhoneInputTextFiled.snp.makeConstraints { make in
            make.left.right.equalTo(phemailLabel)
            make.top.equalTo(phemailLabel.snp.bottom).offset(22)
            make.height.equalTo(21)
        }
        emailPhoneInputTextFiled.becomeFirstResponder()
        idtextFiledUnderline.snp.makeConstraints { make in
            make.top.equalTo(emailPhoneInputTextFiled.snp.bottom).offset(13)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(2)
            
        }
        pwLabel.snp.makeConstraints { make in
            make.top.equalTo(idtextFiledUnderline.snp.bottom).offset(64)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(17)
        }
        pwInputTextField.snp.makeConstraints { make in
            make.left.right.equalTo(pwLabel)
            make.top.equalTo(pwLabel.snp.bottom).offset(22)
            make.height.equalTo(21)
        }
        pwInputTextField.becomeFirstResponder()
        
        pwSecureBtn.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(pwInputTextField)
            make.right.equalToSuperview().offset(-20)
        }
        pwtextFiledUnderline.snp.makeConstraints { make in
            make.top.equalTo(pwInputTextField.snp.bottom).offset(13)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(2)
        }
        pwGuideLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(pwtextFiledUnderline)
            make.top.equalTo(pwtextFiledUnderline.snp.bottom).offset(110)
            make.height.equalTo(14)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.top.equalTo(pwGuideLabel.snp.bottom).offset(80)
            make.bottom.equalToSuperview().offset(-20)
        }

    }
}


