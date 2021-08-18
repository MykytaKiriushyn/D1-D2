import UIKit

class AgeController: UIViewController {
    public let service = Service()
    var data: QuizFormModel? = nil
    var maxCharacters = 0
    private var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = service.loadJson(filename: "QuizForm")
        ageTextField.delegate = self
        setupView()
    }
    
    func setupView() {
        guard let data = data else { return }
        for item in data.elements {
            if item.type == "Title" {
                titleLabel.text = item.attributes.text
                titleLabel.numberOfLines = item.attributes.titleRange ?? 1
            } else if item.id == 10 {
                ageTextField.placeholder = item.attributes.text
                maxCharacters = item.attributes.textFieldRange ?? 1
                changeKeyboardType(item.attributes.keyboardType, ageTextField)
            }
        }
    }
    
    func changeKeyboardType(_ type: String?, _ textField: UITextField) {
           guard let type = type else { return }
           if type == "Digit" {
               textField.keyboardType = .numberPad
           } else {
               textField.keyboardType = .default
           }
       }

    @IBAction func proceed(_ sender: Any) {
        guard let text = ageTextField.text else { return }
        guard let age = Int(text) else { return }
        summary.age = age
        
                let immatureStoryboard = UIStoryboard(name: "Immature", bundle: nil)
                let immature = immatureStoryboard.instantiateViewController(withIdentifier: "ImmatureChoice") as! ImmatureChoice
                let matureStoryboard = UIStoryboard(name: "Mature", bundle: nil)
                let mature = matureStoryboard.instantiateViewController(withIdentifier: "MatureChoice") as! MatureChoice
                
        guard let data = data else { return }
        if summary.age >= 18 {
            mature.data = data
            mature.summary = summary
            present(mature, animated: true)
        } else {
            immature.data = data
            immature.summary = summary
            present(immature, animated: true)
        }
    }
    
}

extension AgeController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == ageTextField {
            if range.location >= maxCharacters {
                return false
            }
        }
        return true
    }
}

