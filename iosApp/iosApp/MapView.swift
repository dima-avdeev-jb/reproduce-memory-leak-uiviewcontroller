import MapboxMaps
import UIKit

var instanceCounter = 0
var existing = [] as Set<Int>

class MapWidget : UIView {
   var mapView: MapView? = nil
    let instanceId: Int
   override init(frame: CGRect) {
       instanceId = instanceCounter
       existing.insert(instanceId)
       print("init", instanceId, existing)
       instanceCounter += 1
      super.init(frame: frame)
      setupLayout()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
    
    deinit {
        existing.remove(instanceId)
        print("deinit", instanceId, existing)
    }

   private func setupLayout() {
      print("MapWidget setupLayout")
      mapView = createMapView()

      addSubview(mapView!)
   }
   
   private func createMapView() -> MapView {
      MapboxOptions.accessToken = "pk.eyJ1IjoiYmFzZWJldGEiLCJhIjoiY2xwN2JwcGlpMXhndzJqcnhkOXJoczh5dSJ9.DupOId85G0IMyVpJIxSntA"


      let myMapView = MapView(frame: frame)
      myMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      myMapView.ornaments.options.compass.visibility = .hidden
      myMapView.ornaments.options.scaleBar.visibility = .hidden
      myMapView.gestures.options.panEnabled = false
      myMapView.gestures.options.pinchEnabled = false
      myMapView.gestures.options.quickZoomEnabled = false
      myMapView.gestures.options.doubleTapToZoomInEnabled = false
      myMapView.gestures.options.doubleTouchToZoomOutEnabled = false
      myMapView.gestures.options.rotateEnabled = false
      myMapView.gestureRecognizers?.removeAll()
      
      myMapView.ornaments.attributionButton.isHidden = true
      myMapView.ornaments.options.attributionButton.margins = .init(x: -10000, y: 0)
      myMapView.ornaments.options.logo.margins = .init(x: -10000, y: 0)
      //40.67077264853346, -111.4869634079512
      myMapView.mapboxMap.setCamera(
         to: CameraOptions(
            center: CLLocationCoordinate2D(
               latitude: 40.67077264853346,
               longitude: -111.4869634079512
            ),
            zoom: 14,
            bearing: 0.0,
            pitch: 80.0
         )
      )
      return myMapView
   }
   
}
