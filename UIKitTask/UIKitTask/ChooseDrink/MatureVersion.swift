import UIKit

class MatureChoice: UIViewController {
    
    var data = QuizFormModel(elements: [])
    var summary = Summary(age: 0, drink: "", info: "", additionalTaste: "", description: "")
    
    @IBOutlet weak var chooseDrinkLabel: UILabel!
    @IBOutlet weak var teaToggle: UISwitch!
    
    @IBOutlet weak var cofeeToggle: UISwitch!
    
    @IBOutlet weak var beerToggle: UISwitch!
    
    @IBOutlet weak var wineToggle: UISwitch!
    
    @IBOutlet weak var teaLabel: UILabel!
    @IBOutlet weak var cofeeLabel: UILabel!
    
    @IBOutlet weak var beerLabel: UILabel!
    
    
    @IBOutlet weak var wineLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setToggles()
    }
    
    func setupView() {
        for item in data.elements {
            if item.id == 2 {
                chooseDrinkLabel.text = item.attributes.text
                guard let buttons = item.attributes.buttons else { return }
                for button in buttons {
                    switch button.id {
                    case 20:
                        beerLabel.text = button.title
                    case 21:
                        wineLabel.text = button.title
                    case 22:
                        teaLabel.text = button.title
                    case 23:
                        cofeeLabel.text = button.title
                    default:
                        print("error")
                    }
                }
            }
        }
    }
    func setToggles() {
        teaToggle.isOn = false
        cofeeToggle.isOn = false
        wineToggle.isOn = false
        beerToggle.isOn = false
    }
    @IBAction func proceed(_ sender: Any) {
        let teaStoryboard = UIStoryboard(name: "TypeOfTea", bundle: nil)
        let tea = teaStoryboard.instantiateViewController(withIdentifier: "ChoiceOfTea") as! ChoiceOfTea
        let coffeeStoryboard = UIStoryboard(name: "CoffeeChoice", bundle: nil)
        let coffee = coffeeStoryboard.instantiateViewController(withIdentifier: "CoffeeChoice") as! CoffeeChoice
        let beerStoryboard = UIStoryboard(name: "BeerDescription", bundle: nil)
        let beer = beerStoryboard.instantiateViewController(withIdentifier: "BeerDescription") as! BeerDescription
        let wineStoryboard = UIStoryboard(name: "WineDescription", bundle: nil)
        let wine = wineStoryboard.instantiateViewController(withIdentifier: "WineDescription") as! WineDescription
        
        if teaToggle.isOn {
            tea.data = data
            tea.summary = summary
            present(tea, animated: true)
        } else if cofeeToggle.isOn {
            coffee.data = data
            coffee.summary = summary
            present(coffee, animated: true)
        }
        else if wineToggle.isOn {
            wine.data = data
            wine.summary = summary
            present(wine, animated: true)
        } else {
            beer.data = data
            beer.summary = summary
            present(beer, animated: true)
        }
    }
    @IBAction func teaToggleAction(_ sender: Any) {
        if teaToggle.isOn {
            guard let text = teaLabel.text else { return }
            summary.drink = text
            cofeeToggle.isOn = false
            beerToggle.isOn = false
            wineToggle.isOn = false
        }
    }
    @IBAction func coffeeToggleAction(_ sender: Any) {
        if cofeeToggle.isOn {
            guard let text = cofeeLabel.text else { return }
            summary.drink = text
            teaToggle.isOn = false
            beerToggle.isOn = false
            wineToggle.isOn = false
        }
    }
    @IBAction func beerToggleAction(_ sender: Any) {
        if beerToggle.isOn {
            guard let text = beerLabel.text else { return }
            summary.drink = text
            cofeeToggle.isOn = false
            teaToggle.isOn = false
            wineToggle.isOn = false
        }
    }
    @IBAction func wineToggleAction(_ sender: Any) {
        if wineToggle.isOn {
            guard let text = teaLabel.text else { return }
            summary.drink = text
            cofeeToggle.isOn = false
            beerToggle.isOn = false
            teaToggle.isOn = false
        }
    }
}
