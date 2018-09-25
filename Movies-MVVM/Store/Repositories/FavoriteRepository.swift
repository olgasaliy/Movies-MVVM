//
//  FavoriteRepository.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/3/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import CoreData

class FavoriteRepository {
    
    private let container: CoreDataConteiner
    
    init(_ container: CoreDataConteiner) {
        self.container = container
    }
    
    func fetchAll() -> [MovieDetails] {
        do {
            return try container.viewContext
                .fetch(CDMovieDetails.fetchRequest())
                .compactMap { $0.asMappable() }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    func fetch(by name: String) -> [MovieDetails] {
        return fetch(by: "title contains[c] \(name)", with: container.viewContext).compactMap { $0.asMappable() }
    }
    
    private func fetchManagedObject(by id: Int) -> CDMovieDetails? {
        return fetch(by: "id == \(Double(id))", with: container.viewContext).first
    }
    
    private func fetch(by predicate: String, with context: NSManagedObjectContext) -> [CDMovieDetails] {
        do {
            let fetchRequest: NSFetchRequest = CDMovieDetails.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: predicate)
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            return fetchedResults
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    func fetch(by id: Int) -> MovieDetails? {
        return fetchManagedObject(by: id)?.asMappable()
    }
    
    func contains(movie: MovieDetails) -> Bool {
        return fetch(by: movie.id) != nil
    }
    
    func add(_ movie: MovieDetails) {
        let context = container.writeContext
        container.writeContext.perform {
            _ = movie.asManagedObject(with: context)
            context.saveOrRollback()
        }
    }
    
    func remove(_ movie: MovieDetails) {
        let context = container.writeContext
        context.perform { [weak self] in
            guard let managedObject = self?.fetch(by: "id == \(Double(movie.id))", with: context).first else {
                return
            }
            self?.container.viewContext.delete(managedObject)
            self?.container.viewContext.saveOrRollback()
        }
    }
    
    
}
