import UIKit

class ImmatureChoice: UIViewController {
    
    var data = QuizFormModel(elements: [])
    var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
    
    @IBOutlet weak var chooseDrinkLabel: UILabel!
    @IBOutlet weak var teaToggle: UISwitch!
    @IBOutlet weak var coffeeToggle: UISwitch!
    @IBOutlet weak var teaLabel: UILabel!
    
    @IBOutlet weak var coffeeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setToggles()
    }
    
    func setToggles() {
        teaToggle.isOn = false
        coffeeToggle.isOn = false
    }
    func setupView() {
        for item in data.elements {
            if item.id == 11 {
                chooseDrinkLabel.text = item.attributes.text
                guard let buttons = item.attributes.buttons else { return }
                for button in buttons {
                    switch button.id {
                    case 22:
                        teaLabel.text = button.title
                    case 23:
                        coffeeLabel.text = button.title
                    default:
                        print("error")
                    }
                }
            }
        }
    }
    
    @IBAction func proceed(_ sender: Any) {
                let teaStoryboard = UIStoryboard(name: "TypeOfTea", bundle: nil)
                let tea = teaStoryboard.instantiateViewController(withIdentifier: "ChoiceOfTea") as! ChoiceOfTea
                let coffeeStoryboard = UIStoryboard(name: "CoffeeChoice", bundle: nil)
                let coffee = coffeeStoryboard.instantiateViewController(withIdentifier: "CoffeeChoice") as! CoffeeChoice
                
        if teaToggle.isOn {
            tea.data = data
            tea.summary = summary
            present(tea, animated: true)
        } else {
            coffee.data = data
            coffee.summary = summary
            present(coffee, animated: true)
        }
    }
    
    @IBAction func teaToggleAction(_ sender: Any) {
        if teaToggle.isOn {
            guard let text = teaLabel.text else { return }
            summary.drink = text
            coffeeToggle.isOn = false
        }
    }
    @IBAction func coffeeToggleAction(_ sender: Any) {
        if coffeeToggle.isOn {
            guard let text = coffeeLabel.text else { return }
            summary.drink = text
            teaToggle.isOn = false
        }
        
    }
}
