//
//  DealListCordinator.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 19/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import Foundation
import Tempo

final class DealListCoordinator: TempoCoordinator {
    
    // MARK: Presenters, view controllers, view state.
    
    var presenters = [TempoPresenterType]() {
        didSet {
            present(viewState!)
        }
    }
    
    private(set) var viewState: DealListState? {
        didSet {
            
            present(viewState!)
        }
    }
    
    let dispatcher = Dispatcher()
    
    weak var viewController: DealListController?
    
    private var dealListItems:[DealModel]?;
    
    // MARK: Init
    
    required init() {
//        viewState = DealListState(listItems: [])
//        updateState()
//        registerListeners()
        self.viewState = DealListState(listItems: [])
        self.updateState()
        self.registerListeners()
      
    }
    
    // MARK: ListCoordinator
    
    private func registerListeners() {
        dispatcher.addObserver(DealListItemPressed.self) { [weak self] e in
            if let vc = self?.viewController{
                NavigationManager.navigateToProductDetail(id:e.item.identifier, vc: vc)
                
            }
        }
    }
    
    
    private func updateState() {
        
        DealModelRepo.getDealList { data in
            var dataList:[DealListItem];
            dataList  = data.products.map({ item in return  DealListItem(identifier:item.id, title: item.title, price: item.salePrice?.displayString ?? "", imageUrl: URL.init(string: item.imageUrl))})
            self.viewState?.listItems = dataList;
            self.viewController?.dataLoaded()
        
        }


        
       
    }
}
