import Foundation
import CryptoKit

let urlString = "https://v2.jokeapi.dev/joke/Programming"

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("DEBUG: \(String(describing: error?.localizedDescription))")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("DEBUG: response status code = \(response.statusCode)")
            guard let data = data else { return }
            var dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString ?? "data is nil")
        }
    }.resume()
}


// MARK: - Task with Star
let publicKey = "875ac65d365dc4bf882349b6946bcb76"
let privateKey = "720643086da2de79d997e5286b65e74488baa2db"
let ts = Date().timeIntervalSince1970.description
let hash = MD5(string: ts + privateKey + publicKey)
let marvelUrl = "https://gateway.marvel.com/v1/public/comics/10223?ts=" + ts + "&apikey=" + publicKey + "&hash=" + hash


// MARK: - func to create md5 hash
func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: Data(string.utf8))
    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}
 getData(urlRequest: marvelUrl)
