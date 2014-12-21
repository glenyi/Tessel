//
//  BeaconManager.swift
//  Acme Works
//
//  Created by Glen Yi on 2014-12-20.
//  Copyright (c) 2014 On The Pursuit. All rights reserved.
//

import CoreLocation

class BeaconManager: NSObject {

    private let locationManager = CLLocationManager()
    
    var delegate: CLLocationManagerDelegate? {
        get {
            return self.locationManager.delegate
        }
        
        set(delegate) {
            self.locationManager.delegate = delegate
        }
    }
    
    override init() {
        super.init()
        
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func startMonitoringRegion(region: CLBeaconRegion) {
        self.locationManager.startMonitoringForRegion(region)
    }
    
    func stopMonitoringRegions() {
        for region in self.locationManager.monitoredRegions {
            self.locationManager.stopMonitoringForRegion(region as CLRegion)
        }
    }
}
