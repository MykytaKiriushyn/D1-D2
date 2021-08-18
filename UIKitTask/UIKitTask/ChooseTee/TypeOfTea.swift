import UIKit

class ChoiceOfTea: UIViewController {
    
    var data = QuizFormModel(elements: [])
    var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
    
    @IBOutlet weak var chooseTeaLabel: UILabel!
    @IBOutlet weak var blackToggle: UISwitch!
    @IBOutlet weak var greenToggle: UISwitch!
    @IBOutlet weak var herbalToggle: UISwitch!
    @IBOutlet weak var otherToggle: UISwitch!
    
    @IBOutlet weak var blackLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var herbalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setToggles()
        
    }
    func setToggles() {
        blackToggle.isOn = false
        greenToggle.isOn = false
        herbalToggle.isOn = false
        otherToggle.isOn = false
    }
    func setupView() {
        for item in data.elements {
            if item.id == 6 {
                chooseTeaLabel.text = item.attributes.text
                guard let buttons = item.attributes.buttons else { return }
                for button in buttons {
                    switch button.id {
                    case 60:
                        blackLabel.text = button.title
                    case 61:
                        greenLabel.text = button.title
                    case 62:
                        herbalLabel.text = button.title
                    case 63:
                        otherLabel.text = button.title
                    default:
                        print("error")
                    }
                }
            }
        }
    }
    
    @IBAction func proceed(_ sender: Any) {
        let teaStoryboard = UIStoryboard(name: "TeaDescription", bundle: nil)
        let tea = teaStoryboard.instantiateViewController(withIdentifier: "TeaDescription") as! TeaDescription
        tea.data = data
        tea.summary = summary
        present(tea, animated: true)
    }
    @IBAction func blackToggleAction(_ sender: Any) {
        if blackToggle.isOn {
            guard let text = blackLabel.text else { return }
            summary.drink += text
            greenToggle.isOn = false
            herbalToggle.isOn = false
            otherToggle.isOn = false
        }
    }
    @IBAction func greenToggleAction(_ sender: Any) {
        if greenToggle.isOn {
            guard let text = greenLabel.text else { return }
            summary.drink += text
            blackToggle.isOn = false
            herbalToggle.isOn = false
            otherToggle.isOn = false
        }
    }
    @IBAction func herbalToggleAction(_ sender: Any) {
        if herbalToggle.isOn {
            guard let text = herbalLabel.text else { return }
            summary.drink += text
            greenToggle.isOn = false
            blackToggle.isOn = false
            otherToggle.isOn = false
        }
    }
    @IBAction func otherToggleAction(_ sender: Any) {
        if otherToggle.isOn {
            guard let text = otherLabel.text else { return }
            summary.drink += text
            greenToggle.isOn = false
            herbalToggle.isOn = false
            blackToggle.isOn = false
        }
    }
}
