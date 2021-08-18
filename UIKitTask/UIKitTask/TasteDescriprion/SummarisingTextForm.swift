import UIKit

struct Summary {
    var age: Int
    var drink: String
    var info: String
    var additionalTaste: String
    var description: String
}

class SummarisingDescription: UIViewController {
    
    var data = QuizFormModel(elements: [])
    var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
    var maxCharacters = 0
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextForm: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextForm.delegate = self
        setupView()
    }
    
    func setupView() {
        for item in data.elements {
            if item.id == 4 {
                descriptionLabel.text = item.attributes.text
                descriptionLabel.numberOfLines = item.attributes.titleRange ?? 1
                maxCharacters = item.attributes.textFieldRange ?? 1
            }
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        guard let text = descriptionTextForm.text else { return }
        summary.description += text
        printResults()
    }
    
    func printResults() {
        print(summary.age)
        print(summary.drink)
        print(summary.info)
        print(summary.additionalTaste)
        print(summary.description)
    }
}

extension SummarisingDescription: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == descriptionTextForm {
            if range.location >= maxCharacters {
                return false
            }
        }
        return true
    }
}
