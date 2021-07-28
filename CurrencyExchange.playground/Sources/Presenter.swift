protocol CurrencyPresenter {
    
    var currency: [CurrencyValue] { get }
    func exchangeCurrency()
    func getCurrency()
}

final class CurrencyPresenterImp {
    
    var currency: [CurrencyValue] = []
    
    private weak var view: CurrencyView?
    
    init(view: CurrencyView) {
        self.view = view
    }
}

//MARK: - CurrencyPresenter
extension CurrencyPresenterImp: CurrencyPresenter {
    
    func getCurrency() {}
    
    func exchangeCurrency() {}
}


