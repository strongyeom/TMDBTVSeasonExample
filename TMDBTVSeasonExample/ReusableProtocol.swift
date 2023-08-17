//
//  ReusableProtocol.swift
//  TMDBTVSeasonExample
//
//  Created by 염성필 on 2023/08/17.
//

import Foundation

protocol ReusableProtocol {
    static var identifier: String { get }
}

extension CollectionViewCell: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension HeaderCollectionReusableView : ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
