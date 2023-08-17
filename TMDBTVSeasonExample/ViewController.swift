//
//  ViewController.swift
//  TMDBTVSeasonExample
//
//  Created by 염성필 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tmdbCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSetup()
        settingCollectionViewFlowLayout()
    }
    
    func configureSetup() {
        tmdbCollectionView.dataSource = self
        tmdbCollectionView.delegate = self
        
        let nib = UINib(nibName: CollectionViewCell.identifier, bundle: nil)
        tmdbCollectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        let headerNib = UINib(nibName: HeaderCollectionReusableView.identifier, bundle: nil)
        tmdbCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func settingCollectionViewFlowLayout() {
        
    }


}

extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
