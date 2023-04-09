//
//  MenuService.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/08.
//

import Foundation
import RxSwift



class MenuService {
    static func getMenu() -> Observable<MenuModel> {
        return Observable<MenuModel>.create { observer -> Disposable in
            Request.gets(route: Constant.API.url, param: [:]) { data in
                do {
                    let result = try MyDecoder().decode(MenuModel.self, from: data)
                    observer.onNext(result)
                    observer.onCompleted()

                }catch {
                    print("error_ 발생\(error)")
                }
            }
            return Disposables.create()
            
        }
    }
}
