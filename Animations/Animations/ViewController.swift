import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var executeNavigationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func executeNavigation(_ sender: Any) {
        guard let destinationVC = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        destinationVC.modalPresentationStyle = .custom
        destinationVC.transitioningDelegate = self
        present(destinationVC, animated: true)
        print("yes")
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .dismiss)
    }
}
