//
//  MyViewModel.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa


class MyViewModel {
    
    private let bag = DisposeBag()
    
    private let model = BehaviorRelay<GetMenu> (value: .init(
        menulist : []
    ))
   
    struct Inputs {
        var pageLoad: Observable<Void>
    }
    
    var menulist : Driver<[MenuItem]>
    init(_ inputs: Inputs) {
        menulist = model.map { $0.menulist }.asDriver {error in .empty()}
        
    }
    
    func getMenuList() {
        MenuService.getMenu().subscribe { (data : MenuModel) in
            var nextModel = self.model.value
            nextModel.menulist = data.menus ?? []
            self.model.accept(nextModel)

        }.disposed(by:self.bag)
//        MenuService.getMenu().subscribe { (data: MenuModel) in
//              if var nextModel = try? self.model.value() {
//                  nextModel.menulist = data.menus ?? []
//                  self.model.onNext(nextModel)
//              }
//          }.disposed(by: bag)
    }
    
}
