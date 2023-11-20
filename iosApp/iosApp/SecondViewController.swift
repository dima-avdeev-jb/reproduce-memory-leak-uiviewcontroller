import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        // If you want to customize the back button
        // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(customBackAction))
    }

    // If you've added a custom back button, use this method
    @objc func customBackAction() {
        navigationController?.popViewController(animated: true)
    }
}
