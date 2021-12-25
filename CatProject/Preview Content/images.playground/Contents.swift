import Foundation
import UIKit
import PlaygroundSupport


let url = URL(string: "https://cdn2.thecatapi.com/images/NTCLZJ1aU.jpg")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let data = data, let image = UIImage(data: data) {
        print("success")
        let i = image
    }
    PlaygroundPage.current.finishExecution()
}
task.resume()
