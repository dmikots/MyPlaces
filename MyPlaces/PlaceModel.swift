//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Р71 on 04.12.2020.
//

import UIKit

struct Place {
    var name: String
    var type: String?
    var restaurantName: String?
    var location: String?
    var image: UIImage?
    
    static let restaurantNames = [
    "Burger Heroes", "Kitchen", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль",
        "Sherlock Holmes", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life",
    "Шок", "Бочка"]
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restaurantNames{
            places.append(Place(name: place, type: "Restaurant", restaurantName: place, location: "Moscow", image: nil))
            
        }
        return places
    }

}
