//
//  TableView+RegisterItems.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func registerNib<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)

        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func registerHeaderFooterNib<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            #if DEBUG
                fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
            #else
                return T()
            #endif
        }

        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) -> T {
        
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            #if DEBUG
                fatalError("Could not dequeue tableView header/footer with identifier: \(T.defaultReuseIdentifier)")
            #else
                return T()
            #endif
        }
        return headerFooterView
    }
}
