import UIKit

//"image": {
//      "height": 1445,
//      "id": "0XYvRd7oD",
//      "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
//      "width": 1204
//    },

struct Breed: Codable {
    let id: String
    let name: String
    let temperament: String
}

struct BreadImage: Codable {
    let breeds: [Breed]
    let height: Int
    let id: String
    let url: String
    let width: Int
}

let selectedCatBreedId = "abys"
let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=9")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    let decoder = JSONDecoder()
    if let data = data {
        do {
            let images = try decoder.decode([BreadImage].self, from: data)
            print("success, fetched \(images.count) images")
        } catch {
            print(error)
        }
    }
}
task.resume()
