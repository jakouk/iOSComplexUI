//
//  DataCollectionCell.swift
//  CollectionIn
//
//  Created by jakouk on 2018. 9. 26..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class DataCollectionCell: UICollectionViewCell {
  @IBOutlet weak var tableView: UITableView!
  var subjectList = [String]()
  var subList = [String]()
  var resultList = [String]()
  
  func infoTableDataSetting(subjectList: [String], subList: [String],
                            resultList: [String] ) {
    
    self.subjectList = subjectList
    self.subList = subList
    self.resultList = resultList
    
    tableView.isScrollEnabled = false
    tableView.dataSource = self
    tableView.delegate = self
    tableView.reloadData()
  }
}

extension DataCollectionCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.subjectList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "infoTableCell", for: indexPath) as! InfoTableCell
    cell.subjectLabel.text = subjectList[indexPath.row]
    cell.subLabel.text = subList[indexPath.row]
    cell.resultLabel.text = resultList[indexPath.row]
    return cell
  }
}

extension DataCollectionCell: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
}
