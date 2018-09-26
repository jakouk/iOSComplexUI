//
//  VerticalCollectionCell.swift
//  TableInCollection
//
//  Created by jakouk on 2018. 9. 23..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class VerticalTableCell: UITableViewCell {
  @IBOutlet weak var verticalCollection: UICollectionView!
  var stringList = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
      verticalCollection.dataSource = self
      verticalCollection.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func verticalDataSetting(stringList: [String]) {
    self.stringList = stringList
  }
}

extension VerticalTableCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return stringList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! VerticalCell
    cell.verticalLabel.text = stringList[indexPath.item]
    
    return cell
  }
}

extension VerticalTableCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = UIScreen.main.bounds.width
    let height = collectionView.frame.height / 4
    return CGSize(width: width, height: height)
  }
}

