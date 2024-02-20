import Foundation


func fetchTime(city: String,  showAlert: @escaping (_ title: String, _ message: String) -> Void, completionHandler: @escaping (_ data: City) -> ()) {
    let url = URL(string: "https://worldtimeapi.org/api/timezone/Europe/\(city)")!
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
            print("Error with fetching films: \(error)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            DispatchQueue.main.async {
                showAlert("Sorry...", "We dont know what the time in \(city)")
            }
            return
        }
        
        if let data = data,
           let cityData = try? JSONDecoder().decode(City.self, from: data) {
            completionHandler(cityData)
        }
    })
    task.resume()
}



