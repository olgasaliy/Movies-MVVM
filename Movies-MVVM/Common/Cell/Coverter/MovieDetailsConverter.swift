//
//  MovieDetailsConverter.swift
//  MoviesNew
//
//  Created by Olga Saliy on 8/27/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

class MovieDetailsConverter {
    
    private let details: MovieDetails
    private let repository: FavoriteRepository

    init(_ details: MovieDetails, _ repository: FavoriteRepository) {
        self.details = details
        self.repository = repository
    }
    
    func convertSections() -> [TableViewSectionItem] {
        let generalSection = convertGeneralSection()
        let overviewSection = convertOverviewSection()
        var result = [generalSection, overviewSection]
        if let companySection = convertCompanySection() {
            result.append(companySection)
        }
        return result
    }
    
    private func convertGeneralSection() -> TableViewSectionItem  {
        let item = GeneralDetailsItem(details)
        item.isLiked = repository.contains(movie: details)
        let section = TableViewSectionItem(name: "General", items: [item])
        return section
    }
    
    private func convertOverviewSection() -> TableViewSectionItem  {
        let section = TableViewSectionItem(name: "Overview", items: [OverviewDetailsItem(details)])
        return section
    }
    
    private func convertCompanySection() -> TableViewSectionItem?  {
        guard let companies = details.companies else {
            return nil
        }
        
        let unsortedCompanies = companies.compactMap { CompanyDetailsItem($0) }
        let section = TableViewSectionItem(name: "Production Companies", items: unsortedCompanies.sorted(by: { $0.name < $1.name }))
        return section
    }
    
}
