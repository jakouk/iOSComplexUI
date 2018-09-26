//
//  InfoCollectionCell.swift
//  CollectionIn
//
//  Created by jakouk on 2018. 9. 26..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class InfoCollectionCell: UICollectionViewCell {
  @IBOutlet weak var imageCollectionView: UICollectionView!
  @IBOutlet weak var pageCollectionView: UICollectionView!
  var stringList = [String]()
  var idx = 0
  
  func infoDataSetting(stringList: [String]) {
    self.stringList = stringList
    
    imageCollectionView.dataSource = self
    imageCollectionView.delegate = self
    
    pageCollectionView.dataSource = self
    pageCollectionView.delegate = self
    
    imageCollectionView.reloadData()
    pageCollectionView.reloadData()
  }
}

extension InfoCollectionCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == imageCollectionView {
      return stringList.count
    } else {
      return stringList.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == imageCollectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
      cell.label.text = stringList[indexPath.item]
      return cell
    } else {
      if indexPath.item == idx {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectCell", for: indexPath) as! SelectCell
        return cell
      } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "normalCell", for: indexPath) as! NormalCell
        return cell
      }
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    if collectionView == imageCollectionView {
      return 1
    } else {
      return 1
    }
  }
}

extension InfoCollectionCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == imageCollectionView {
      let width = UIScreen.main.bounds.width - 16
      return CGSize(width: width, height: collectionView.frame.height)
    } else {
      let width: CGFloat
      if indexPath.item == idx {
        width = 32
      } else {
        width = 13
      }
      return CGSize(width: width, height: collectionView.frame.height)
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageWidth = scrollView.frame.width - 16
    let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
    if scrollView == imageCollectionView {
      self.idx = currentPage
      pageCollectionView.reloadData()
    }
  }
}
