import Foundation
import UIKit

protocol CurrencyView: AnyObject {
    
    func update()
}

class CurrencyViewController: UIViewController {
    
    private var presenter: CurrencyPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.getCurrency()
    }
    
    func inject(presenter: CurrencyPresenter!) {
        self.presenter = presenter
    }
}
extension CurrencyViewController: CurrencyView {
    
    func update() {}
}

