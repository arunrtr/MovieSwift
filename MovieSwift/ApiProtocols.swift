//
//  ApiProtocols.swift
//  MovieSwift
//
//  Created by Arun Kumar on 9/26/18.
//  Copyright © 2018 Arun Kumar. All rights reserved.
//

import Foundation
protocol MoviesListProtocol{
    
    func getMoviesListFinished(data arrMovies:[Movie]?)
}
