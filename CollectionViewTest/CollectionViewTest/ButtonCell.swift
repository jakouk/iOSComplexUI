//
//  buttonCell.swift
//  CollectionViewTest
//
//  Created by jakouk on 15/06/2019.
//  Copyright © 2019 jakouk. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell {
  var tagName: UILabel!
  var gradientButton: UIButton!
  private var horizontalPadding: CGFloat = 32
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    tagName = UILabel()
    contentView.addSubview(tagName)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    var frame = tagName.frame
    frame.size.height = self.frame.size.height
    frame.size.width = self.frame.size.width
    frame.origin.x = 0
    frame.origin.y = 0
    tagName.frame = frame
  }
  
  func configureCell(tag: String) {
    tagName.text = tag
    tagName.textColor =  UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
    tagName.textAlignment = .center
    
    tagName.backgroundColor = .yellow
    
    tagName.layer.backgroundColor  = UIColor.red.cgColor
    tagName.layer.cornerRadius = 5
    
//    tagName.layer.cornerRadius = 20
  }
  
  func setMaximumCellWidth(_ width: CGFloat) {
    let frame = tagName.frame
    let x = frame.origin.x
    let y = frame.origin.y
    let height = frame.height
    let newWidth = width - horizontalPadding
    tagName.frame = CGRect(x: x, y: height, width: newWidth, height: height)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
