//
//  DealDetailViewController.swift
//  ProductViewer
//
//  Created by Abhinav Agarwal on 25/01/22.
//  Copyright © 2022 Target. All rights reserved.
//

import UIKit
import Tempo
import Combine


class DealDetailViewController: UIViewController {
    
  
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var btnAddToList: UIButton!

    
    let viewModel:DealDetailViewModel!
    
    @IBOutlet var vcView: UIView!
    
    init(viewModel:DealDetailViewModel){
        self.viewModel = viewModel;
        super.init(nibName: "DealDetailViewController", bundle: nil)
    }
    
    
    init(productId:Int){
        self.viewModel = DealDetailViewModel(_id:productId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView:UICollectionView = {
        let harmonyLayout = HarmonyLayout()
        
        harmonyLayout.collectionViewMargins = HarmonyLayoutMargins(top: .narrow, right: .none, bottom: .narrow, left: .none)
        harmonyLayout.defaultSectionMargins = HarmonyLayoutMargins(top: .narrow, right: .none, bottom: .none, left: .none)
        harmonyLayout.defaultItemMargins = HarmonyLayoutMargins(top: .full, right: .full, bottom: .full, left: .full)
        harmonyLayout.defaultItemStyle = .detached
    
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: harmonyLayout)
        collectionView.backgroundColor = .targetFadeAwayGrayColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
       
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindParams();
        self.title = "Target"
        self.view.backgroundColor = UIColor.white
        self.viewModel.screenLoaded()
       // self.view.addSubview(vcView)
//        view.addAndPinSubview(collectionView)
//        collectionView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
//
//        let components: [ComponentType] = [
//            DealDetailBannerComponent()
//        ]
//        
//        let componentProvider = ComponentProvider(components: components, dispatcher: coordinator.dispatcher)
//        let collectionViewAdapter = CollectionViewAdapter(collectionView: collectionView, componentProvider: componentProvider)
//      
//        
//        coordinator.presenters = [
//            SectionPresenter(adapter: collectionViewAdapter)
//        ]

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    private var cancellables: Set<AnyCancellable> = []
    private func bindParams(){
        
        viewModel.$description.sink {
            self.lblDescription.text = $0
                }.store(in: &cancellables)
        
        viewModel.$price.sink {
            self.lblPrice.text = $0
                }.store(in: &cancellables)
        
        viewModel.$cartButtonText.sink {
            self.btnAddToCart.titleLabel?.text = $0
                }.store(in: &cancellables)
        
        viewModel.$listButtonText.sink {
            self.btnAddToList.titleLabel?.text = $0
                }.store(in: &cancellables)
        
        viewModel.$imgUrl.sink {
            
                guard let path = $0 else{
                    return;
                }
                guard let url = try? URL.init(string: path) else{
                    return;
                }
                self.imgProduct.load(url: url)
            }.store(in: &cancellables)
            
            

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
