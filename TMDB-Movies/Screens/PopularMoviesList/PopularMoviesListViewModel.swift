//
//  PopularMoviesListViewModel.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import RxSwift

protocol PopularMoviesListViewModel {
    var items: Observable<[Item]> { get }
    
    func didAchievedBottom()
}

class DefaultPopularMoviesListViewModel: PopularMoviesListViewModel {
    var items: Observable<[Item]>
    private let provider: PopularMoviesListProvider
    
    init(provider: PopularMoviesListProvider) {
        self.provider = provider
        self.items = provider.movies
            .map() {return $0.map(Item.init) + ($0.count > 0 ? [Item.paginationTrigger] : [])}
        
    }
    
    func didAchievedBottom() {
        provider.fetchNext()
    }
}

enum Item {
    case movie(Movie)
    case paginationTrigger
    
    init(_ movie: Movie) {
        self = .movie(movie)
    }
}

