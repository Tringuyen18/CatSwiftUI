//
//  CatBreed.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

import Foundation

//[
//{
//"weight": {
//"imperial": "7  -  10",
//"metric": "3 - 5"
//},
//"id": "abys",
//"name": "Abyssinian",
//"cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
//"vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
//"vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
//"temperament": "Active, Energetic, Independent, Intelligent, Gentle",
//"origin": "Egypt",
//"country_codes": "EG",
//"country_code": "EG",
//"description": "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
//"life_span": "14 - 15",
//"indoor": 0,
//"lap": 1,
//"alt_names": "",
//"adaptability": 5,
//"affection_level": 5,
//"child_friendly": 3,
//"dog_friendly": 4,
//"energy_level": 5,
//"grooming": 1,
//"health_issues": 2,
//"intelligence": 5,
//"shedding_level": 2,
//"social_needs": 5,
//"stranger_friendly": 5,
//"vocalisation": 1,
//"experimental": 0,
//"hairless": 0,
//"natural": 1,
//"rare": 0,
//"rex": 0,
//"suppressed_tail": 0,
//"short_legs": 0,
//"wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
//"hypoallergenic": 0,
//"reference_image_id": "0XYvRd7oD",
//"image": {
//"id": "0XYvRd7oD",
//"width": 1204,
//"height": 1445,
//"url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"
//}
//}
//]

struct Breed: Codable, CustomStringConvertible, Identifiable {
    // MARK: - Properties
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreadImage?
    
    // MARK: - init
    init(id: String, name: String, temperament: String, explaination: String, energyLevel: Int, isHairless: Bool, image: BreadImage?) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.breedExplaination = explaination
        self.energyLevel = energyLevel
        self.isHairless = isHairless
        self.image = image
    }
    
    var description: String {
        return "Breed with name \(name) and id \(id), energyLevel: \(energyLevel), isHairless: \(isHairless ? "Yes" : "No")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
        image = try values.decodeIfPresent(BreadImage.self, forKey: .image)
    }
    
    // MARK: - Dummy Data
    static func dummyData1() -> Breed {
        return Breed(id: "abys", name: "Abyssinian", temperament: "Active, Energetic, Independent, Intelligent, Gentle", explaination: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", energyLevel: 5, isHairless: false, image: BreadImage(height: 1445, width: 1204, id: "abys", url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"))
    }
    
    
    static func dummyData2() -> Breed {
        return Breed(id: "age", name: "Aegean", temperament: "Affectionate, Social, Intelligent, Playful, Active", explaination: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children" , energyLevel: 3, isHairless: false, image: BreadImage(height: 800, width: 1200, id: "aege", url: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg"))
    }
}

