//
//  TableCellTableViewCell.swift
//  TableInCollection
//
//  Created by jakouk on 2018. 9. 23..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {
  @IBOutlet weak var tableView: UITableView!
  var stringList = [String]()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      tableView.dataSource = self
      tableView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func tableDataSetting(stringList: [String]) {
    self.stringList = stringList
  }
}

extension TableCellTableViewCell: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stringList.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableInCell", for: indexPath) as! TableInTableViewCell
    cell.tableInLabel.text = stringList[indexPath.row]
    return cell
  }
}

extension TableCellTableViewCell: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
}


