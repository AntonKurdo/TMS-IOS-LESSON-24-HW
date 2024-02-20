import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let animationTime = 0.3
        static let cityArray = ["Tirane", "Andorra-la-vella", "Jerevan", "Vienna", "Baku", "Minsk", "Brussels", "Sarajevo", "Sofia", "Zagreb", "Nicosia", "Prague", "Copenhagen", "Tallinn", "Helsinki", "Paris", "Cayenne", "Tbilisi", "Berlin", "Athens", "Budapest", "Reykjavik", "Rome", "Riga", "Vaduz", "Vilnius", "Luxemburg", "Skopje", "Valletta", "Fort-de-France", "Kishinev", "Monaco", "Amsterdam", "Oslo", "Belfast", "Warsaw", "Lisbon", "Bucharest", "San Marino", "Edinburgh", "Bratislava", "Ljubljana", "Madrid", "Stockholm", "Berne", "Dushanbe", "Kiev", "London", "Tashkent", "Vatican City", "Belgrade"].sorted();
    }
    
    var selectedCityIndex = 0 {
        didSet {
            UIView.animate(withDuration: Constants.animationTime) {
                self.view.backgroundColor = UIColor.random()
            }
        }
    }

    var cityLabel = Constuctor.createLabel(title: "No city changed!!!")
    var timeLabel = Constuctor.createLabel(title: "")
    var button = Constuctor.createButton(title: "Change city")
    lazy var pickerView: UIView = Constuctor.createPickerView(vc: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: Constants.animationTime) {
            self.view.backgroundColor = UIColor.random()
        }
        
        setupLabels()
        setupButton()
        setupPicker()
    }
    
    private func setupPicker() {
        view.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height / 2),
            pickerView.topAnchor.constraint(equalTo: view.bottomAnchor),
            pickerView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    
    private func setupButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 50),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let action = UIAction {_ in
            UIView.animate(withDuration: 0.314) {
                self.pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 2.5, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
            }
        }
        button.addAction(action, for: .touchUpInside)
    }
    
    private func setupLabels() {
        view.addSubview(cityLabel)
        view.addSubview(timeLabel)
        
        timeLabel.font = UIFont.systemFont(ofSize: 50)
        cityLabel.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
        ])
    }
}



