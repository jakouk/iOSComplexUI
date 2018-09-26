//
//  HorizontalCollectionCell.swift
//  TableInCollection
//
//  Created by jakouk on 2018. 9. 23..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class HorizontalTableCell: UITableViewCell {
  @IBOutlet weak var horizonCollection: UICollectionView!
  @IBOutlet weak var pageLabel: UILabel!
  
  var stringList = [String]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    horizonCollection.dataSource = self
    horizonCollection.delegate = self
    horizonCollection.isPagingEnabled = true
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func horizontalDataSetting(stringList: [String]) {
    self.stringList = stringList
  }
}

extension HorizontalTableCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return stringList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! HorizonCell
    cell.horizonLabel.text = stringList[indexPath.item]
    return cell
  }
}

extension HorizontalTableCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width
    let height = collectionView.frame.height
    return CGSize(width: width, height: height)
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageWidth = horizonCollection.frame.size.width
    let currentPage = horizonCollection.contentOffset.x / pageWidth

    if 0 != fmodf(Float(currentPage), 1) {
      
      pageLabel.text = "\(Int(currentPage) + 2)"
    } else {
      pageLabel.text = "\(Int(currentPage) + 1)"
    }
  }
}
