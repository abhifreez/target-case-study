//
//  DealListView.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 19/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import UIKit
import Tempo

final class DealListView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
  
   func configureUI(){
       self.layer.cornerRadius = 10
       self.layer.masksToBounds = true
       self.layer.borderColor = UIColor.gray.cgColor;
       self.layer.borderWidth = 0.5
       self.layoutMargins.top = 10
        
    }
}
extension DealListView: ReusableNib {
    @nonobjc static let nibName = "DelaListView"
    @nonobjc static let reuseID = "DealListViewIdentifier"

    @nonobjc func prepareForReuse() {
       
        
    }
}
