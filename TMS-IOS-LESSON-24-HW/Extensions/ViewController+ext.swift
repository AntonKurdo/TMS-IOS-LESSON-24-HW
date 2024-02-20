import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.cityArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.cityArray.sorted()[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCityIndex = row
        fetchTime(city: Constants.cityArray[row], showAlert: showAlertMessage) { city in
            let date = Date(timeIntervalSince1970: Double(city.unixtime))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium
            dateFormatter.dateStyle = DateFormatter.Style.none
            dateFormatter.timeZone = TimeZone(abbreviation: city.abbreviation)
            let localDate = dateFormatter.string(from: date)
            DispatchQueue.main.async {
                self.timeLabel.text = localDate
                self.cityLabel.text = Constants.cityArray[row]
            }
        }
    }
}


extension ViewController {
    func showAlertMessage(title: String, message: String ){
        
        let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertMessagePopUpBox.addAction(okButton)

        self.present(alertMessagePopUpBox, animated: true)
    }
}
