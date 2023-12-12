import Foundation

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

getData(urlRequest: urlString)
