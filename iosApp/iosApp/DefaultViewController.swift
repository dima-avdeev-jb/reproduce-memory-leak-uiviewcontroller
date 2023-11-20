import UIKit
import shared

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
       BackNavigateKt.backNavigateFlow.watch { [weak self] _ in
          self?.navigationController?.popViewController(animated: true)
       }

        let openSecondVCButton = UIButton(type: .system)
        openSecondVCButton.setTitle("Open Second View Controller", for: .normal)
        openSecondVCButton.addTarget(self, action: #selector(openSecondVC), for: .touchUpInside)
        openSecondVCButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openSecondVCButton)

        NSLayoutConstraint.activate([
            openSecondVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openSecondVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func openSecondVC() {
       // switch default navbar visibility to fix mem leak. for some reason SecondViewController memory
       // gets freed if back navigation occurs through default navigation bar
       navigationController?.setNavigationBarHidden(true, animated: false)
       //navigationController?.setNavigationBarHidden(false, animated: false)
       let mapboxVC = Mapbox_iosKt.createMapboxVC(
         createMapView: { [weak self] in 
            MapWidget(frame: self!.view.frame) }
       )
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(mapboxVC, animated: true)
    }
}
