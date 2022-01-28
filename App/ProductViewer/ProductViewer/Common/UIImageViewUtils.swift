//
//  UIImageViewUtils.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 27/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
