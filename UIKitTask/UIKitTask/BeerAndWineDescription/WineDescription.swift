import UIKit

class WineDescription: UIViewController {
    
    var data = QuizFormModel(elements: [])
    var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
    var maxCharacters = 0
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.delegate = self
        setupView()
    }
    func setupView() {
        for item in data.elements {
             if item.id == 5 {
                descriptionTextField.placeholder = item.attributes.text
                maxCharacters = item.attributes.textFieldRange ?? 1
                descriptionLabel.text = item.attributes.text
                descriptionLabel.numberOfLines = item.attributes.titleRange ?? 1
            }
        }
    }
    
    @IBAction func proceed(_ sender: Any) {
        guard let text = descriptionTextField.text else { return }
        let summaryStoryboard = UIStoryboard(name: "SummarisingDescription", bundle: nil)
        let summaryVC = summaryStoryboard.instantiateViewController(withIdentifier: "SummarisingDescription") as! SummarisingDescription
        summaryVC.data = data
        summary.info = text
        summaryVC.summary = summary
        present(summaryVC, animated: true)
    }
}

extension WineDescription: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == descriptionTextField {
            if range.location >= maxCharacters {
                return false
            }
        }
        return true
    }
}
