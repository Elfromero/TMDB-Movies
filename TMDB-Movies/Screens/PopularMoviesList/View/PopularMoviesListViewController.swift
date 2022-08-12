//
//  PopularMoviesListViewController.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxCoreData

class PopularMoviesListViewController: UIViewController, StoryboardInstantiable {
    
    @IBOutlet var tableView: UITableView!
    var viewModel: PopularMoviesListViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(MovieVTCell.self)
        
        tableView.rx.willDisplayCell
            .bind { [unowned self] event in
                guard let cell = event.cell as? MovieVTCell else { return }
                if cell.isPaginationTrigger {
                    self.viewModel.didAchievedBottom()
                }
            }.disposed(by: disposeBag)
        
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: MovieVTCell.nibName, cellType: MovieVTCell.self)) { row, event, cell in
            switch event {
            case .movie(let movie):
                cell.configure(with: movie)
            case .paginationTrigger:
                cell.configureForPagination()
            }
        }.disposed(by: disposeBag)
    }
}
