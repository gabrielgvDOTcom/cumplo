//
//  OpportunityView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class OpportunityView: BaseController {

    var filters: [FilterEntity] = []
    var opportunities: [OpportunityEntity] = []
    
    //MARK: - VARs
    var presenter: OpportunityProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!

    //MARK: Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }

    //MARK: - Action´s Buttons
    @IBAction func filterTapped(_ sender: Any) {
        presenter?.presentFilterView()
    }
    @IBAction func ecommerceTapped(_ sender: Any) {
        
    }
    
    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension OpportunityView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return opportunities.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OpportunityCell", for: indexPath) as! OpportunityCell
        cell.display(item: opportunities[indexPath.row])
        return cell
    }
}
extension OpportunityView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.pushPreviewView(opportunity: opportunities[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader, !filters.isEmpty {
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "OpportunityFilter", for: indexPath) as! OpportunityFilter
            return cell
        }
        return UICollectionReusableView()
    }
}
extension OpportunityView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 20, height: 260)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if !filters.isEmpty {
            return CGSize(width: collectionView.frame.size.width, height: 60)
        }
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
extension OpportunityView: OpportunityProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(filters data: [FilterEntity]) {
        filters = data
    }
    func deliver(opportunities data: [OpportunityEntity]) {
        opportunities = data
        collectionView.reloadData()
    }
    
    //MARK: Random
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present(container: self)
    }

    func style() {
    }
    func title(str: String) {
        self.title = str
    }
    func message(viewWithTitle title: String, andMessage message: String) {
        
    }
}
