//
//  NetworkManager.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 26/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import Foundation
import Alamofire




struct NetworkManager{
    
    static  let baseUrl = "https://api.target.com/mobile_case_study_deals/v1"
    
    static func request<T:Decodable>(type:T.Type,path:String,complition: @escaping (Any?,Any?)->Void){
        
        let request = AF.request(baseUrl+path)
        request.responseDecodable {(data:DataResponse<T, AFError>) in
            
            switch data.result{
            case .failure(_):
                complition(nil,NSError())
                break;
            case .success(let obj):
                complition(obj,nil)
                break;
            }
    

        }
        
    }
    
    
}

