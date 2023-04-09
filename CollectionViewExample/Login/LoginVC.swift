//
//  LoginVC.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import UIKit
import RxCocoa
import RxSwift
class LoginVC: UIViewController {
    
    private lazy var v = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        setbind()
        print("sdafasdf")
    }
    
    func setbind() {
        //MARK: -  로그인버튼
        v.loginBtn.rx.tap.bind { [weak self] in
            print("sdafasdf")
            let vc = LoginInpuVC()
            vc.a = "로그인"
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: false)
        }
        //MARK : - 계정만들기 버튼
        
        v.idCreateBtn.rx.tap.bind { [weak self] in
            print("sdafasdf")
            let vc = LoginInpuVC()
            vc.a = "계정 만들기"
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: false)
        }
    }
}
