import UIKit
import MapKit

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var bottomCard: UIView!

  let locationManager = CLLocationManager()
  let regionInMeters = 10000 // Radius in meters around Mysore Palace

  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    centerMapOnLocation(location: CLLocation(latitude: 12.305444, longitude: 76.65515))
    addAnnotation(location: CLLocation(latitude: 12.305444, longitude: 76.65515), title: "Mysore Palace")
    configureBottomCard()
  }

  func configureBottomCard() {
    // Customize bottomCard to display Mysore Palace information here
    bottomCard.backgroundColor = .white
    bottomCard.layer.cornerRadius = 10
  }

  func centerMapOnLocation(location: CLLocation) {
      let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: CLLocationDistance(regionInMeters), longitudinalMeters: CLLocationDistance(regionInMeters))
    mapView.setRegion(coordinateRegion, animated: true)
  }

  func addAnnotation(location: CLLocation, title: String) {
    let annotation = MKPointAnnotation()
    annotation.coordinate = location.coordinate
    annotation.title = title
    mapView.addAnnotation(annotation)
  }
}

// MARK: - CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if manager.authorizationStatus == .authorizedWhenInUse {
      locationManager.startUpdatingLocation()
    }
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
      centerMapOnLocation(location: location)
    }
  }
}

