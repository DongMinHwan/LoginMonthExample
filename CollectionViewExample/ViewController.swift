//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/07.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RxViewController

class ViewController: UIViewController  {

    /**
        weekley 데이터
        로그인 UI
        이메일 입력 비밀번호 입력 이미지 수정
        스크롤 관련해서 물어보기
     */
    var weekDay = DateManager.shared.getWeekDateInfo()
    private lazy var v = MainView()
    var vm : MyViewModel!
    var menul  = [MenuItem]()
    var disposed = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        vm = setInput()
        
        dateGet()
        v.weeklycollectionView.delegate = self
        v.weeklycollectionView.dataSource = self
        v.weeklycollectionView.register(TestCell.self, forCellWithReuseIdentifier: TestCell.registerId)
        
        
        v.tableView.delegate = self
        v.tableView.dataSource = nil
        v.tableView.register(TableViewCel.self, forCellReuseIdentifier: TableViewCel.registerId)
        getData()
    }
    //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
    func setInput() -> MyViewModel {
        let inputs = MyViewModel.Inputs(pageLoad: self.rx.viewWillAppear.map { _ in
            print("page load_MainHome")
        })
        
        return MyViewModel(inputs)
    }
    func dateGet() {
        for dateInfo in weekDay {
            let weekeday = dateInfo.weekday.prefix(1)
            let day = String(dateInfo.day)
            let month = dateInfo.month
            print("\(weekeday) \(day) \(month)")
        }
        
        
    }
    
    
    func getData() {
        vm.getMenuList()

        vm.menulist.drive(v.tableView.rx.items(cellIdentifier: TableViewCel.registerId, cellType: TableViewCel.self)) { (row, tableData: MenuItem, cell: TableViewCel) in
            cell.item.text = tableData.name
            print("sdfsdfasd : \(tableData.name)")
            cell.price.text = String(tableData.price ?? 0)
        }
    }
}

extension  ViewController :  UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCell.registerId, for: indexPath) as! TestCell

        var day = String(weekDay[indexPath.item].weekday.prefix(1))
        var day2 = String(weekDay[indexPath.item].day)
        var day3 = weekDay[indexPath.item].month
        cell.dateChange(day,day2,day3,indexPath.item)
        return cell
    }
    

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  menul.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == v.tableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCel.registerId, for: indexPath) as? TableViewCel {
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("00000")
        
        DispatchQueue.main.async {
            let vc = LoginVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
}
 
