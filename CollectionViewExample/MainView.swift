//
//  File.swift
//  CollectionViewExample
//
//  Created by DongMin Hwang on 2023/04/07.
//

import UIKit
import SnapKit
import Then

class MainView : UIView {
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    let weeklyLabel = UILabel().then {
        $0.text = "Weeklyu Calendar"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 30)
    }
    let weeklySubLabel = UILabel().then {
        $0.text = "고양이와 차분한 일상을님의 문화 생활 캘린더"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 25)
    }
    
    let weeklycollectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then { make in
        let itemSize = CGSize(width: 132, height: 172)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = itemSize
        layout.minimumLineSpacing = 2// <-
        layout.minimumInteritemSpacing = 0
        
        make.isScrollEnabled = true
        make.showsHorizontalScrollIndicator = false
        make.showsVerticalScrollIndicator = true
        make.backgroundColor = .red
        make.clipsToBounds = true
//        make.register(TestCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
        make.isPagingEnabled = false // <- 한 페이지의 넓이를 조절 할 수 없기 때문에 scrollViewWillEndDragging을 사용하여 구현
        make.contentInsetAdjustmentBehavior = .never // <- 내부적으로 safe area에 의해 가려지는 것을 방지하기 위해서 자동으로 inset조정해 주는 것을 비활성화
        make.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        make.decelerationRate = .fast // <- 스크롤이 빠르게 되도록 (페이징 애니메이션같이 보이게하기 위함)
        make.translatesAutoresizingMaskIntoConstraints = false
        make.collectionViewLayout = layout
    }
 
    
    let circularView = CircularView()
    
    let tableView = UITableView().then {
        $0.rowHeight = 80
        $0.showsVerticalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
//        $0.estimatedRowHeight = 44
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
        backgroundColor = .clear
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(weeklyLabel)
        contentView.addSubview(weeklySubLabel)
        contentView.addSubview(circularView)
        contentView.addSubview(weeklycollectionView)
        contentView.addSubview(tableView)
    }
    func setlayout() {
        scrollView.snp.makeConstraints { make in
                  make.edges.equalToSuperview() // 스크롤뷰가 표현될 영역
        }
        contentView.snp.makeConstraints {make in
                  make.width.equalToSuperview()
                  make.centerX.top.bottom.equalToSuperview()
        }
        
        weeklyLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(22)
            make.height.equalTo(22)
        }
        
        weeklySubLabel.snp.makeConstraints { make in
            make.left.equalTo(weeklyLabel)
            make.right.equalToSuperview()
            make.top.equalTo(weeklyLabel.snp.bottom).offset(16)
        }
        weeklycollectionView.snp.makeConstraints { make in
            make.top.equalTo(weeklySubLabel.snp.bottom).offset(18)
            make.left.equalTo(weeklyLabel.snp.left)
            make.right.equalToSuperview()
            make.height.equalTo(172)
         
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(weeklycollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-15)
            $0.bottom.equalToSuperview()
        }
        //width 132 height 172
//        circularView.snp.makeConstraints { make in
//
//            make.left.equalTo(weeklySubLabel.snp.left)
//            make.top.equalTo(weeklySubLabel.snp.bottom).offset(50)
//        }
        
    }
    
   
}


