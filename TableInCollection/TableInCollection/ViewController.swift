//
//  ViewController.swift
//  TableInCollection
//
//  Created by jakouk on 2018. 9. 23..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var mainTableView: UITableView!
  let horizonString = ["sky", "taiwan", "cathayPacific",
                    "2017", "4 people", "china"]
  let verticalString = ["홍콩", "영국", "크로아티아", "프랑스", "이탈리아", "스위스"]
  let tableInString = ["코스모스", "경제학 교과서", "돌배게", "라틴어 수업", "모든순간이 너였다"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainTableView.dataSource = self
    mainTableView.delegate = self
    mainTableView.estimatedRowHeight = UITableViewAutomaticDimension
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let indexRow = indexPath.row
    if indexRow == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "horizontalCell", for: indexPath) as! HorizontalTableCell
      cell.horizontalDataSetting(stringList: horizonString)
      cell.horizonCollection.reloadData()
      return cell
    } else if indexRow == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "verticalCell", for: indexPath) as! VerticalTableCell
      cell.verticalDataSetting(stringList:  verticalString)
      cell.verticalCollection.reloadData()
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableCellTableViewCell
      cell.tableDataSetting(stringList: tableInString)
      cell.tableView.reloadData()
      return cell
    }
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableViewAutomaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let index = indexPath.row
    
    if index == 0 {
      let width = UIScreen.main.bounds.width
      let height = (315 * width) / 375
      return height
    } else if index == 1 {
      return 44 * 4
    } else {
      return 44 * 4
    }
  }
}


