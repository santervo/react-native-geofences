import Foundation
import CoreLocation

@objc(Geofences)
class Geofences: RCTEventEmitter, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()

        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    @objc
    override func constantsToExport() -> [AnyHashable : Any]! {
        return [:]
    }

    @objc
    func addGeofence(_ params: Dictionary<String, Any>, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        let latitude = params["latitude"] as! CLLocationDegrees
        let longitude = params["longitude"] as! CLLocationDegrees
        let radius = params["radius"] as! CLLocationDistance
        let center = CLLocationCoordinate2DMake(latitude, longitude)
        let identifier = params["id"] as! String
        let region = CLCircularRegion(center: center, radius: radius, identifier: identifier)
        locationManager.startMonitoring(for: region)
    }

    @objc
    func removeGeofence(_ id: String, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
        let region = locationManager.monitoredRegions.first(where:  { (region) -> Bool in region.identifier == id })
        
        if region != nil {
            locationManager.stopMonitoring(for: region!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        sendEvent(withName: "onEnterRegion", body: region.identifier)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        sendEvent(withName: "onExitRegion", body: region.identifier)
    }

    override func supportedEvents() -> [String]! {
      return ["onEnterRegion", "onExitRegion"]
    }

    @objc
    override static func requiresMainQueueSetup() -> Bool {
      return true
    }
}
