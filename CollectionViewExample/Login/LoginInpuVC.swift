//
//  LoginInpuVC.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import UIKit
import RxCocoa
import RxSwift

class LoginInpuVC: UIViewController {

    private lazy var v = LoginInputView()
    var bag = DisposeBag()
    var a : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        v.headerView.headerTitle.text = a
        setbind()
    }
    
    func setbind() {
        v.headerView.backBtn.rx.tap.bind { [weak self] in
            self?.dismiss(animated: false)
        }
        
        v.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            
            print("로그인버튼")
        }).disposed(by: bag)
        
        v.pwSecureBtn.rx.tap.subscribe(onNext : { [weak self] in
            print("비밀번호 보기")
        })
        
        
                                    
        
    }

}
