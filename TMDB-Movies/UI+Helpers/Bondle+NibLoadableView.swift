//
//  Bondle+NibLoadableView.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import UIKit

protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension Bundle {
    
    func load<T: UIView>(_: T.Type) -> T where T: NibLoadableView {
        guard let views = loadNibNamed(T.nibName, owner: nil, options: nil) as? [UIView],
            let view = views.first as? T else {
                fatalError("Couldn't find \(T.nibName)")
        }
        
        return view
    }
}
