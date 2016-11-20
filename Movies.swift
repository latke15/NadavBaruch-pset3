//
//  File.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 16-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import Foundation
class movies {
    var id = ""
    var title = ""
    var year = ""
    var rated = ""
    var released = ""
    var runTime = ""
    var genre = ""
    var director = ""
    var writer = ""
    var actors = ""
    var plot = ""
    var language = ""
    var country = ""
    var awards = ""
    var poster = ""
    var metascore = ""
    var imdbRating = ""
    var imdbVotes = ""
    var imdbID = ""
    var type = ""
    var response = ""
}


func parse(json data: Data) -> [String: Any]? {
    do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
        return nil
    }
}

func parse(dict dictionary: [String: Any]) -> movies! {
    
    let result = movies()
    
    if let title = dictionary["Title"] {
        result.title = title as! String
    }
    
    if let year = dictionary["Year"] {
        result.year = year as! String
    }
    
    if let rated = dictionary["Rated"] {
        result.rated = rated as! String
    }
    
    if let released = dictionary["Released"] {
        result.released = released as! String
    }
    
    if let runtime = dictionary["Runtime"] {
        result.runTime = runtime as! String
    }
    
    if let genre = dictionary["Genre"] {
        result.genre = genre as! String
    }
    
    if let director = dictionary["Director"] {
        result.director = director as! String
    }
    
    if let writer = dictionary["Writer"] {
        result.writer = writer as! String
    }
    
    if let actors = dictionary["Actors"] {
        result.actors = actors as! String
    }
    
    if let plot = dictionary["Plot"] {
        result.plot = plot as! String
    }
    
    if let language = dictionary["Language"] {
        result.language = language as! String
    }
    
    if let country = dictionary["Country"] {
        result.country = country as! String
    }
    
    if let awards = dictionary["Awards"] {
        result.awards = awards as! String
    }
    
    if let poster = dictionary["Poster"] {
        result.poster = poster as! String
    }
    
    if let metascore = dictionary["Metascore"] {
        result.metascore = metascore as! String
    }
    
    if let imdbRating = dictionary["imdbRating"] {
        result.imdbRating = imdbRating as! String
    }
    
    if let imdbVotes = dictionary["imdbVotes"] {
        result.imdbVotes = imdbVotes as! String
    }
    
    if let imdbID = dictionary["imdbID"] {
        result.imdbID = imdbID as! String
    }
    
    if let type = dictionary["Type"] {
        result.type = type as! String
    }
    
    if let response = dictionary["Response"] {
        result.response = response as! String
    }
    
    return result
}
