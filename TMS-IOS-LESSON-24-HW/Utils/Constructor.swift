import UIKit

class Constuctor {
    static func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    

    static func createPickerView(vc: UIPickerViewDelegate & UIPickerViewDataSource) -> UIView {
        
        let pickerView = UIView()
        let picker = UIPickerView()
        let closeButton = UIButton()
        
        pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
        pickerView.backgroundColor = .lightText
        
        pickerView.layer.shadowColor = UIColor.black.cgColor
        pickerView.layer.shadowOpacity = 1
        pickerView.layer.shadowOffset = .zero
        pickerView.layer.shadowRadius = 10
        
        picker.delegate = vc
        picker.dataSource = vc
        
        let systemImage = UIImage(systemName: "xmark.circle.fill") ;
        closeButton.setImage(systemImage, for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.tintColor = .black
        closeButton.isPointerInteractionEnabled = true
        pickerView.addSubview(picker)
        pickerView.addSubview(closeButton)
        picker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            picker.centerXAnchor.constraint(equalTo: pickerView.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor),
            closeButton.rightAnchor.constraint(equalTo: pickerView.rightAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: 16)
        ])
        
        closeButton.addAction(UIAction {_ in
            UIView.animate(withDuration: 0.314) {
                pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
            }
        }, for: .touchUpInside)
        return pickerView
    }
}
