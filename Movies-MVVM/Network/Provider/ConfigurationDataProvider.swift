//
//  ConfigurationProvider.swift
//  Movies-MVVM
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class ConfigurationDataProvider: DataProvider {
    
    func getConfiguration() -> Observable<Configuration> {
        return execute(request: ConfigurationRouter.getConfiguration)
    }
}
