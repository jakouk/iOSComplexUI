//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by jakouk on 15/06/2019.
//  Copyright © 2019 jakouk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let stringList = ["#30만원대렌트", "#반납가능", "#바로구매", "#풀옵션", "#무사고차량"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    print("viewDidLoad")
    let collectionFrame = CGRect(x: 32, y: 0,
                                width: self.view.frame.width - 64,
                                height: self.view.frame.height)
    
    let flowLayout = CustomLayout()
    flowLayout.sectionInset = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    
    let collectionView = UICollectionView(frame: collectionFrame,
                                            collectionViewLayout: flowLayout)
    collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: "buttonCell")
    collectionView.backgroundColor = .white
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    self.view.addSubview(collectionView)

  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return stringList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCell
    
    cell.layer.cornerRadius = 20
    cell.layer.masksToBounds = true
    
    cell.setMaximumCellWidth(collectionView.frame.width)
    cell.configureCell(tag: stringList[indexPath.row])
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = stringList[indexPath.row].size(withAttributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17.0)])

    print(size)
    
    let modifySize = CGSize(width: size.width + 32, height: 40)
    
    return modifySize
  }
}
