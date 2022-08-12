//
//  RxTableViewSectionedReloadDataSourceFabric.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import RxDataSources

//class RxTableViewSectionedReloadDataSourceFabric {
//    
//    static var popularMoviesList: RxTableViewSectionedReloadDataSource<PopularMoviesListSectionViewModel> = {
//        let configureCell: RxTableViewSectionedReloadDataSource<PopularMoviesListSectionViewModel>.ConfigureCell = { (dataSource, tableView, indexPath, item) in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieVTCell", for: indexPath) as! MovieVTCell
//            cell.configure(with: item)
//            return cell
//        }
//        return RxTableViewSectionedReloadDataSource<PopularMoviesListSectionViewModel>(configureCell: configureCell)
//    }()
//    
//}
