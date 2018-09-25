//
//  MovieDetails.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/16/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreData

class MovieDetails: Mappable {
    
    var id: Int!
    var title: String?
    var releaseDate: String?
    var posterPath: String?
    var rating: Double?
    var spokenLanguages: [SpokenLanguage]?
    var overview: String?
    var companies: [ProductionCompany]?
    
    init() { }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        releaseDate <- map["release_date"]
        posterPath <- map["poster_path"]
        rating <- map["vote_average"]
        spokenLanguages <- map["spoken_languages"]
        overview <- map["overview"]
        companies <- map["production_companies"]
    }
    
}

extension MovieDetails: ToManagedObjectMapping {

    func asManagedObject(with context: NSManagedObjectContext) -> CDMovieDetails {
        let managedObject: CDMovieDetails = context.insertObject()
        
        managedObject.id = Double(id)
        managedObject.title = title
        managedObject.releaseDate = releaseDate
        managedObject.posterPath = posterPath
        managedObject.rating = rating ?? 0.0
        managedObject.overview = overview
        
        spokenLanguages?.forEach { managedObject.addToLanguages($0.asManagedObject(with: context)) }
        companies?.forEach { managedObject.addToCompanies($0.asManagedObject(with: context)) }

        return managedObject
    }
    
}

extension CDMovieDetails: FromManagedObjectMapping {
    
    func asMappable() -> MovieDetails {
        let object = MovieDetails()
        
        object.id = Int(id)
        object.title = title
        object.releaseDate = releaseDate
        object.posterPath = posterPath
        object.rating = rating
        object.overview = overview
        
        object.companies = companies?.allObjects as? [ProductionCompany]
        object.companies = (companies?.allObjects as? [CDProductionCompany])?.compactMap { $0.asMappable() }
        object.spokenLanguages = (languages?.allObjects as? [CDSpokenLanguage])?.compactMap { $0.asMappable() }
        
        return object
    }
    
}
