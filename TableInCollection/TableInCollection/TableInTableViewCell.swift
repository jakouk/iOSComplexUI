//
//  TableInTableViewCell.swift
//  TableInCollection
//
//  Created by jakouk on 2018. 9. 25..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class TableInTableViewCell: UITableViewCell {

  @IBOutlet weak var tableInLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
