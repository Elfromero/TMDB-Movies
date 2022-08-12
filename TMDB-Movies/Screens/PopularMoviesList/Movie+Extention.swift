//
//  Movie+Extention.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 12.08.2022.
//

import CoreData
import RxDataSources
import RxCoreData

func == (lhs: Movie, rhs: Movie) -> Bool {
    return lhs.id == rhs.id
}

//extension Movie : Equatable { }

extension Movie : IdentifiableType {
    public typealias Identity = String

    public var identity: Identity { return "\(id!)" }
}

extension Movie : Persistable {
    
    public typealias T = NSManagedObject
    
    public static var entityName: String {
        return "Movie"
    }
    
    public static var primaryAttributeName: String {
        return "id"
    }
    
    init(entity: T) {
        id = (entity.value(forKey: "id") as? Int)
        title = entity.value(forKey: "title") as? String
        posterPath = entity.value(forKey: "posterPath") as? String
        popularity = entity.value(forKey: "popularity") as? Double
        overview = entity.value(forKey: "overview") as? String
        backdropPath = entity.value(forKey: "backdropPath") as? String
    }
    
    public func update(_ entity: NSManagedObject) {
        entity.setValue(id, forKey: "id")
        entity.setValue(title, forKey: "title")
        entity.setValue(posterPath, forKey: "posterPath")
        entity.setValue(popularity, forKey: "popularity")
        entity.setValue(overview, forKey: "overview")
        entity.setValue(backdropPath, forKey: "backdropPath")
    }
}
