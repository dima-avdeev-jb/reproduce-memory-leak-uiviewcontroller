import UIKit
import shared

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let openSecondVCButton = UIButton(type: .system)
        openSecondVCButton.setTitle("Open Second View Controller", for: .normal)
        openSecondVCButton.addTarget(self, action: #selector(openSecondVC), for: .touchUpInside)
        openSecondVCButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openSecondVCButton)

        NSLayoutConstraint.activate([
            openSecondVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openSecondVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openSecondVC))
        view.addGestureRecognizer(tapGestureRecognizer)
    }


    @objc func openSecondVC() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        // uncomment the one you want to test
        
//         let mapboxVC = Mapbox_iosKt.makeNonLeakingView(
        let mapboxVC = Mapbox_iosKt.makeView(
            createMapView: { [weak self] in
                MapWidget(frame: self!.view.frame)
            },
            pop: { [weak self] in
                self?.navigationController?.popViewController(animated: false)
            }
        )
        
        navigationController?.pushViewController(mapboxVC, animated: false)
    }
}
