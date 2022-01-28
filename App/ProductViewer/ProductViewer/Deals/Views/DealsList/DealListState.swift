//
//  DealListState.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 19/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import Foundation
import Tempo

struct DealListState:TempoViewState, TempoSectionedViewState{
    
    var listItems:[DealListItem];
    var sections:[TempoViewStateSection] {
        return [DealListSection(itemList:listItems)]
    }
    
    
}

struct DealListSection:TempoViewStateSection,Equatable{
    
    let itemList:[DealListItem]
    var items: [TempoViewStateItem]{
        return itemList
    }
    
}

struct DealListItem:TempoViewStateItem,Equatable{
    
    let identifier: Int
    let title: String
    let price: String
    let imageUrl: URL?
    
}
