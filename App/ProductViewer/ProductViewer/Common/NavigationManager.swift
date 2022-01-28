//
//  TNavigationManager.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 25/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import Foundation
import UIKit


struct NavigationManager{
    
    static func navigateToProductDetail(id:Int,vc:UIViewController){
        
       
        let viewController = DealDetailViewController(productId: id)
        vc.navigationController?.pushViewController(viewController, animated: true)
       
        
    }
}

