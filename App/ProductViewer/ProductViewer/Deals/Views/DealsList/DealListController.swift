//
//  ViewController.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 19/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import UIKit
import Tempo

class DealListController: UIViewController {
    
    private let coordinator:TempoCoordinator
    
    init(coordinator:TempoCoordinator){
        self.coordinator = coordinator;
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView:UICollectionView = {
       
        let harmonyLayout = HarmonyLayout()
        
        harmonyLayout.collectionViewMargins = HarmonyLayoutMargins(top: .narrow, right: .none, bottom: .narrow, left: .none)
        harmonyLayout.defaultSectionMargins = HarmonyLayoutMargins(top: .narrow, right: .none, bottom: .none, left: .none)
        harmonyLayout.defaultItemMargins = HarmonyLayoutMargins(top: .none, right: .narrow, bottom: .none, left: .narrow)
        harmonyLayout.defaultItemStyle = .grouped

        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: harmonyLayout)
        collectionView.backgroundColor = .targetFadeAwayGrayColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
       
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Target 2"
        self.view.backgroundColor = UIColor.white
        collectionView.delegate = self;
        view.addAndPinSubview(collectionView)
        collectionView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

       
      
    
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func dataLoaded(){
        let components: [ComponentType] = [
            DealListComponent()
        ]
        
        let componentProvider = ComponentProvider(components: components, dispatcher: self.coordinator.dispatcher)
        let collectionViewAdapter = CollectionViewAdapter(collectionView: self.collectionView, componentProvider: componentProvider)
        self.coordinator.presenters = [
            SectionPresenter(adapter: collectionViewAdapter)
        ]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DealListController:HarmonyLayoutDelegate{
    
    func harmonyLayout(_ harmonyLayout: HarmonyLayout, tileSpacingForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func harmonyLayout(_ harmonyLayout: HarmonyLayout, marginsForItemAtIndexPath indexPath: IndexPath) -> HarmonyLayoutMargins {
        return HarmonyLayoutMargins.init(top: .full, right: .full, bottom: .full, left: .full)
    }
}
