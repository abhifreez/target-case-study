//
//  DealListComponent.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 19/01/22.
//  Copyright © 2022 Target. All rights reserved.
//


import Tempo

struct DealListComponent: Component {
    var dispatcher: Dispatcher?

    func prepareView(_ view: DealListView, item: DealListItem) {
        // Called on first view or ProductListView
    }
    
    func configureView(_ view: DealListView, item: DealListItem) {
        view.configureUI()
        view.titleLabel.text = item.title
        view.priceLabel.text = item.price
        guard item.imageUrl != nil else{
            
            return;
        }
        view.imgView.load(url: item.imageUrl!)
        
    }
    
    func selectView(_ view: DealListView, item: DealListItem) {
        dispatcher?.triggerEvent(DealListItemPressed(item: item))
    }
}

extension DealListComponent: HarmonyLayoutComponent {
    func heightForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem, width: CGFloat) -> CGFloat {
        return 180
    }
    
    func tileSpacingForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem) -> CGFloat {
        return 30.0
    }
    
    func separatorHiddenForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem) -> Bool {
        return false;
    }
    func itemMarginsForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem) -> HarmonyLayoutMargins {
        return  HarmonyLayoutMargins.init(top: HarmonyLayoutMarginStyle.half, right: HarmonyLayoutMarginStyle.half, bottom: HarmonyLayoutMarginStyle.full, left: HarmonyLayoutMarginStyle.half)
    }
    
    func paddingForLayout(_ layout: HarmonyLayout, item: TempoViewStateItem) -> UIEdgeInsets {
        UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
   
}
