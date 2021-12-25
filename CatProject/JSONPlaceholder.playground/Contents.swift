import UIKit

//{
//  "userId": 1,
//  "id": 1,
//  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//}


struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    if let data = data {
        
        do {
            let posts = try JSONDecoder().decode([Post].self, from: data)
            print("found \(posts.count) post")
        } catch {
            print(error)
        }
        
    }
    
}

task.resume()



