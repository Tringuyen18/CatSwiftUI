import UIKit

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

//struct Breed: Codable, CustomStringConvertible {
//    let id: String
//    let name: String
//    let temperament: String
//    let breedExplaination: String
//    let energyLever: Int
//    let isHairless: Bool
//    let image: BreadImage
//
//    var description: String {
//        return "Breed with name \(name) and id \(id), energyLevel: \(energyLever), isHairless: \(isHairless ? "Yes" : "No")"
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case temperament
//        case breedExplaination = "description"
//        case energyLever = "energy_level"
//        case isHairless = "hairless"
//        case image
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try values.decode(String.self, forKey: .id)
//        name = try values.decode(String.self, forKey: .name)
//        temperament = try values.decode(String.self, forKey: .temperament)
//        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
//        energyLever = try values.decode(Int.self, forKey: .energyLever)
//
//        let hairless = try values.decode(Int.self, forKey: .isHairless)
//        isHairless = hairless == 1
//
//        image = try values.decode(BreadImage.self, forKey: .image)
//    }
//
//}
//
////"image": {
////      "height": 1445,
////      "id": "0XYvRd7oD",
////      "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
////      "width": 1204
////    },
//
//struct BreadImage: Codable {
//    let height: Int
//    let width: Int
//    let id: String
//    let url: String
//}
//
//
//let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=1")!
//
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//    let decoder = JSONDecoder()
//    if let data = data {
//        do {
//            let breed = try decoder.decode([Breed].self, from: data)
//            print(breed)
//        } catch {
//            print(error)
//        }
//    }
//}
//
//task.resume()
//

////"image": {
////      "height": 1445,
////      "id": "0XYvRd7oD",
////      "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
////      "width": 1204
////    },
//
//struct BreadImage: Codable {
//    let height: Int
//    let width: Int
//    let id: String
//    let url: String
//}
