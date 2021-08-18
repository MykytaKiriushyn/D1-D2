import UIKit

class CoffeeChoice: UIViewController {
    
    var data = QuizFormModel(elements: [])
    var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
    
    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var sugarToggle: UISwitch!
    @IBOutlet weak var milkToggle: UISwitch!
    @IBOutlet weak var iceCreamToggle: UISwitch!
    @IBOutlet weak var cinnamonToggle: UISwitch!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var milkLabel: UILabel!
    @IBOutlet weak var iceCreamLabel: UILabel!
    @IBOutlet weak var cinnamonLabel: UILabel!
    @IBOutlet weak var creamToggle: UISwitch!
    
    @IBOutlet weak var creamLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setToggles()
    }
    
    func setupView() {
        for item in data.elements {
            if item.id == 9 {
                coffeeLabel.text = item.attributes.text
                guard let buttons = item.attributes.buttons else { return }
                for button in buttons {
                    switch button.id {
                    case 90:
                        sugarLabel.text = button.title
                    case 91:
                        milkLabel.text = button.title
                    case 92:
                        creamLabel.text = button.title
                    case 93:
                        iceCreamLabel.text = button.title
                    case 94:
                        cinnamonLabel.text = button.title
                    default:
                        print("error")
                    }
                }
            }
        }
    }
    
    func setToggles() {
        sugarToggle.isOn = false
        creamToggle.isOn = false
        iceCreamToggle.isOn = false
        cinnamonToggle.isOn = false
        milkToggle.isOn = false
        
    }
    @IBAction func proceed(_ sender: Any) {
        let summaryStoryboard = UIStoryboard(name: "SummarisingDescription", bundle: nil)
        let summaryVC = summaryStoryboard.instantiateViewController(withIdentifier: "SummarisingDescription") as! SummarisingDescription
        summaryVC.data = data
        summaryVC.summary = summary
        present(summaryVC, animated: true)
    }
    @IBAction func sugarToggleAction(_ sender: Any) {
        if sugarToggle.isOn {
            guard let text = sugarLabel.text else { return }
            summary.additionalTaste += text
        }
    }
    @IBAction func milkToggleAction(_ sender: Any) {
        if milkToggle.isOn {
            guard let text = milkLabel.text else { return }
            summary.additionalTaste += text
        }
    }
    @IBAction func iceCreamToggleAction(_ sender: Any) {
        if iceCreamToggle.isOn {
            guard let text = iceCreamLabel.text else { return }
            summary.additionalTaste += text
        }
    }
    @IBAction func cinnamonToggleAction(_ sender: Any) {
        if cinnamonToggle.isOn {
            guard let text = cinnamonLabel.text else { return }
            summary.additionalTaste += text
        }
    }
}
