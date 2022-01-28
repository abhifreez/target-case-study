//
//  DealModel.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 26/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import Foundation

struct DealModelRepo{
    
    static func getDealWithId(_productId:Int,complition:@escaping (_ data:DealModel)->Void){
        
        NetworkManager.request(type: DealModel.self, path: "/deals/"+String(_productId), complition:{ (data,error) in
            
            if data != nil{
                complition(data as! DealModel);
            }
            else{
             // throw NetworkError.requestError
            }
            
        })
    }
    static func getDealList(complition:@escaping (_ data:DealList)->Void){
        
        NetworkManager.request(type: DealList.self, path: "/deals", complition:{ (data,error) in
            
            if data != nil{
                complition(data as! DealList);
            }
            else{
             // throw NetworkError.requestError
            }
            
        })
    }
    
    
}

class DealList:Decodable{
    var products:[DealModel]
    
     enum CodingKeys:String,CodingKey {
         case products = "products"

     }
     
}

class DealModel:Decodable{
    
    var id:Int = 0
    var title:String = ""
    var aisle:String = ""
    var description:String = ""
    var imageUrl:String = ""
    var regularPrice:PriceModel?
    var salePrice:PriceModel?
    
   
    enum CodingKeys:String,CodingKey {
        case id="id"
        case title="title"
        case aisle="aisle"
        case description="description"
        case imageUrl="image_url"
        case regularPrice="regular_price"
        case salePrice="sale_price"

    }
    
}


class PriceModel:Decodable{
    
    var amountInCents:Double;
    var currencySymbol:String;
    var displayString:String;
    
    init(amountInCents:Double,currencySymbol:String,displayString:String){
        self.amountInCents = amountInCents;
        self.currencySymbol = currencySymbol;
        self.displayString = displayString;
     
    }
    
    enum CodingKeys:String,CodingKey{
        
        case amountInCents="amount_in_cents"
        case currencySymbol="currency_symbol"
        case displayString="display_string"
    }
}
