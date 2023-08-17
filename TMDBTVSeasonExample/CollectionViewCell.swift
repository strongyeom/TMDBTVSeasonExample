//
//  CollectionViewCell.swift
//  TMDBTVSeasonExample
//
//  Created by 염성필 on 2023/08/17.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var maintitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleToFill
    }
    
    // Cell이 재사용 될때 Cell에 기존에 들어 있던 데이터를 삭제하고 재사용 할 수 있게 만들어 준다.
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        maintitle.font = .systemFont(ofSize: 13)
    }

}
