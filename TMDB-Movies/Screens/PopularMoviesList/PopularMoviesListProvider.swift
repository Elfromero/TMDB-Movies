//
//  PopularMoviesListProvider.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import CoreData
import RxSwift
import RxCoreData

protocol PopularMoviesListProvider {
    var movies: Observable<[Movie]> { get }
    
    func fetchNext()
}

class DefaultPopularMoviesListProvider: PopularMoviesListProvider {
    
    struct Url {
        static let popular: String = "https://api.themoviedb.org/3/movie/popular"
    }
    
    var movies: Observable<[Movie]>
    
    private var managedObjectContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        managedObjectContext = context
        movies = managedObjectContext.rx.entities(Movie.self, sortDescriptors: [NSSortDescriptor(key: "popularity", ascending: false)])
        fetchNext()
    }
    
    func fetchNext() {
        downloadNextItems()
    }
    
    private func downloadNextItems() {
        guard let url = URL(string: Url.popular + "?api_key=\(AppConfig.shared.apiKey)") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let data = data else { return }
            guard let moviesResponse = try? JSONDecoder().decode(MoviesListResponse.self, from: data) else { return }
            moviesResponse.results.forEach() { movie in
                DispatchQueue.main.async { [weak self] in
                    try? self?.managedObjectContext.rx.update(movie)
                }
            }
        }.resume()
    }
}
