//
//  ViewController.swift
//  TMDBTVSeasonExample
//
//  Created by 염성필 on 2023/08/17.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet var tmdbCollectionView: UICollectionView!
    
    var witchEpList: [WitcherEpisode] = []
    var seasonWitchEpList: [[WitcherEpisode]] = []
    // var season: Int = 1
    let group = DispatchGroup()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        configureSetup()
        settingCollectionViewFlowLayout()
        
//        callrequest(episode: 1) { response in
//            self.witchEpList.append(response)
//            self.callrequest(episode: 2) { response in
//                self.witchEpList.append(response)
//                self.callrequest(episode: 3) { response in
//                    self.witchEpList.append(response)
//                    self.callrequest(episode: 4) { response in
//                        self.witchEpList.append(response)
//                        self.callrequest(episode: 5) { response in
//                            self.witchEpList.append(response)
//                            self.callrequest(episode: 6) { response in
//                                self.witchEpList.append(response)
//                                self.callrequest(episode: 7) { response in
//                                    self.witchEpList.append(response)
//                                    self.callrequest(episode: 8) { response in
//                                        self.witchEpList.append(response)
//                                        self.seasonWitchEpList.append(self.witchEpList)
//                                        self.witchEpList.removeAll()
//                                        self.callTworequest(episode: 1) { response in
//                                            self.witchEpList.append(response)
//                                            self.callTworequest(episode: 2) { response in
//                                                self.witchEpList.append(response)
//                                                self.callTworequest(episode: 3) { response in
//                                                    self.witchEpList.append(response)
//                                                    self.callTworequest(episode: 4) { response in
//                                                        self.witchEpList.append(response)
//                                                        self.callTworequest(episode: 5) { response in
//                                                            self.witchEpList.append(response)
//                                                            self.callTworequest(episode: 6) { response in
//                                                                self.witchEpList.append(response)
//                                                                self.callTworequest(episode: 7) { response in
//                                                                    self.witchEpList.append(response)
//                                                                    self.callTworequest(episode: 8) { response in
//                                                                        self.witchEpList.append(response)
//                                                                        self.seasonWitchEpList.append(self.witchEpList)
//                                                                        self.witchEpList.removeAll()
//                                                                        self.callThreerequest(episode: 1) { response in
//                                                                            self.witchEpList.append(response)
//                                                                            self.callThreerequest(episode: 2) { response in
//                                                                                self.witchEpList.append(response)
//                                                                                self.callThreerequest(episode: 3) { response in
//                                                                                    self.witchEpList.append(response)
//                                                                                    self.callThreerequest(episode: 4) { response in
//                                                                                        self.witchEpList.append(response)
//                                                                                        self.callThreerequest(episode: 5) { response in
//                                                                                            self.witchEpList.append(response)
//                                                                                            self.callThreerequest(episode: 6) { response in
//                                                                                                self.witchEpList.append(response)
//                                                                                                self.callThreerequest(episode: 7) { response in
//                                                                                                    self.witchEpList.append(response)
//                                                                                                    self.callThreerequest(episode: 8) { response in
//                                                                                                        self.witchEpList.append(response)
//                                                                                                        self.seasonWitchEpList.append(self.witchEpList)
//                                                                                                        self.witchEpList.removeAll()
//                                                                                                        print("seasonWitchEpList[0]",self.seasonWitchEpList[0].count)
//                                                                                                        print("seasonWitchEpList[1]",self.seasonWitchEpList[1].count)
//                                                                                                        print("seasonWitchEpList[2]",self.seasonWitchEpList[2].count)
//                                                                                                        self.tmdbCollectionView.reloadData()
//                                                                                                    }
//                                                                                                }
//                                                                                            }
//                                                                                        }
//                                                                                    }
//                                                                                }
//                                                                            }
//                                                                        }
//                                                                    }
//                                                                }
//                                                            }
//                                                        }
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
       
        
       
            for i in 0...2 {
                for j in 1...8 {
                    self.callrequest(season: i+1, episode: j) { response in
                        
                            self.witchEpList.append(response)
                            print("witchEpList",self.witchEpList)
                            if j == 8 {
                                self.seasonWitchEpList.append(self.witchEpList)
                                print("seasonWitchEpList2",self.seasonWitchEpList)
                                self.witchEpList.removeAll()
                                print("witchEpList 삭제",self.witchEpList)
                            }
                    }
                }
            }
        
        group.notify(queue: .main) {
            
            print("notify: seasonWitchEpList",self.seasonWitchEpList)
            self.tmdbCollectionView.reloadData()
        }
        
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let spacing: CGFloat = 5
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left:spacing, bottom: spacing, right: spacing)
        layout.headerReferenceSize = CGSize(width: 300, height: 40)
        tmdbCollectionView.collectionViewLayout = layout
    }
    
    func callrequest(season: Int, episode: Int, completionHandler: @escaping (WitcherEpisode) -> Void) {
      
        group.enter()
        WitcherManager.shared.callRequest(season: season, episode: episode) { response in
            
            completionHandler(response)
            self.group.leave()
        }

    }
    
//    func callTworequest(episode: Int, completionHandler: @escaping (WitcherEpisode) -> Void ) {
//        group.enter()
//        WitcherManager.shared.callTwoRequest(episode: episode) { response in
//            print("위치 시즌 2 : \(self.witchEpList)")
//            completionHandler(response)
//            self.tmdbCollectionView.reloadData()
//            self.group.leave()
//        }
//    }
//
//    func callThreerequest(episode: Int, completionHandler: @escaping (WitcherEpisode) -> Void ) {
//        group.enter()
//        WitcherManager.shared.callThreeRequest(episode: episode) { response in
//            print("위치 시즌 3 : \(self.witchEpList)")
//            completionHandler(response)
//            self.tmdbCollectionView.reloadData()
//            self.group.leave()
//        }
//    }
    
    
}

extension ViewController : UICollectionViewDelegate {
    
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if seasonWitchEpList.count > 2 {
                    switch section {
                    case 0:
                        print("seasonWitchEpList[0].count",seasonWitchEpList[0].count)
                        return seasonWitchEpList[0].count
                    case 1:
                        print("seasonWitchEpList[0].count",seasonWitchEpList[1].count)
                        return seasonWitchEpList[1].count
                    case 2:
                        print("seasonWitchEpList[0].count",seasonWitchEpList[2].count)
                        return seasonWitchEpList[2].count
                    default:
                        return 0
                    }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let item = seasonWitchEpList[indexPath.section]
        if seasonWitchEpList.count > 0 {
            switch indexPath.section {
            case 0:
                let item = seasonWitchEpList[indexPath.section][indexPath.row]
                let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face"+item.stillPath)!
                cell.imageView.kf.setImage(with: url)
                cell.maintitle.text = item.name
            case 1:
                let item = seasonWitchEpList[indexPath.section][indexPath.row]
                let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face"+item.stillPath)!
                cell.imageView.kf.setImage(with: url)
                cell.maintitle.text = item.name
            case 2:
                let item = seasonWitchEpList[indexPath.section][indexPath.row]
                let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face"+item.stillPath)!
                cell.imageView.kf.setImage(with: url)
                cell.maintitle.text = item.name
            default:
                return UICollectionViewCell()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
            header.titleLabel.text = "시즌 \(indexPath.section + 1)"
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
}
