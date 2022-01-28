//
//  DealDetailViewModel.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 26/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import UIKit
import Combine

protocol DealDetailViewModelImplimentation{
    
    func screenLoaded()->Void;
    
}


class DealDetailViewModel:DealDetailViewModelImplimentation,ObservableObject{
   
   
  
    //Data Elements
    private var dealModel:DealModel?{
        didSet{
            self.setViewVariables(_dealModel: dealModel!);
        }
    }
    private let id:Int!
    
    //View Elements
    @Published var imgUrl:String?;
    @Published var cartButtonText:String?;
    @Published var listButtonText:String?;
    @Published var description:String?;
    @Published var title:String?;
    @Published var price:String?;
    @Published var offerPrice:String?;
    
    
    init(_id:Int){
        self.id = _id;
    }
    
    private func setViewVariables(_dealModel:DealModel){
        
        self.imgUrl = _dealModel.imageUrl;
        self.description = _dealModel.description;
        self.price = _dealModel.regularPrice?.displayString;
        self.listButtonText = "Add To List"
        self.cartButtonText = "Add To Cart"
        
        
    }
    
     func screenLoaded()->Void {
         DealModelRepo.getDealWithId(_productId: self.id) { data in
            self.dealModel = data;
        }
    }
    
}

