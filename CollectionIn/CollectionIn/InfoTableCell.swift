//
//  InfoTableCell.swift
//  CollectionIn
//
//  Created by jakouk on 2018. 9. 26..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class InfoTableCell: UITableViewCell {
  @IBOutlet weak var subjectLabel: UILabel!
  @IBOutlet weak var subLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
