//
//  ConfigurationProvider.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire

class ConfigurationDataProvider: DataProvider {
    
    func getConfiguration(completion: @escaping (_ response: Configuration?, _ error: Error?) -> ()) {
        execute(request: ConfigurationRouter.getConfiguration, completion: completion)
    }
}
