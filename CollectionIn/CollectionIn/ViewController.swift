//
//  ViewController.swift
//  CollectionIn
//
//  Created by jakouk on 2018. 9. 25..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var mainCollectionView: UICollectionView!
  var stringList = ["sky", "하늘", "blue", "파랑", "taiwan", "대만"]
  
  var tableSubject = ["승계비용", "보증금", "잔존기간"]
  var tableSub = ["(승계시 구매자가 판매자에게 지불)", "(OO종료 후 차량 반납시 환급)", "(OO 종료 후 차량 인수 비용)"]
  var tableResult = ["0만원", "0만원", "0만원"]
  override func viewDidLoad() {
    super.viewDidLoad()
    mainCollectionView.dataSource = self
    mainCollectionView.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let itemIndex = indexPath.item
    if itemIndex == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! InfoCollectionCell
      cell.infoDataSetting(stringList: stringList)
      return cell
    } else {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! DataCollectionCell
      cell.infoTableDataSetting(subjectList: tableSubject, subList: tableSub, resultList: tableResult)
      return cell
    }
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.item == 0 {
      let width = UIScreen.main.bounds.width - 16
      let newHeight = ((480 * width) / 640) + 50
      return CGSize(width: width, height: newHeight)
    } else {
      let width = UIScreen.main.bounds.width - 16
      let height = CGFloat(self.tableSubject.count * 44)
      return CGSize(width: width, height: height)
    }
  }
}

