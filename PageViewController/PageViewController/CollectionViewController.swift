//
//  CollectionViewController.swift
//  PageViewController
//
//  Created by jakouk on 2018. 9. 29..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      collectionView.dataSource = self
      collectionView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
    return cell
  }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
  
}
