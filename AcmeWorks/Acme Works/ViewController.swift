//
//  ViewController.swift
//  Acme Works
//
//  Created by Glen Yi on 2014-12-20.
//  Copyright (c) 2014 On The Pursuit. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var uuidLabel: UILabel!
    @IBOutlet var majorLabel: UILabel!
    @IBOutlet var minorLabel: UILabel!
    
    let beaconManager = BeaconManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Labels init
        self.uuidLabel.text = ""
        self.majorLabel.text = ""
        self.minorLabel.text = ""
        
        // Beacon manager init
        self.beaconManager.delegate = self
        
        let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: AcmeRegionUUID), identifier: AcmeRegionIdentifier)
        region.notifyEntryStateOnDisplay = true
        region.notifyOnEntry = true
        region.notifyOnExit = true
        self.beaconManager.stopMonitoringRegions()
        self.beaconManager.startMonitoringRegion(region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        println("Did start monitoring region \(region)")
    }
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
        println("Did determine state " + (state==CLRegionState.Unknown ? "unknown": (state==CLRegionState.Inside ? "inside":"outside")) + " for region \(region)")
        
        if state==CLRegionState.Inside {
            manager.startRangingBeaconsInRegion(region as CLBeaconRegion)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("Did enter region \(region)")
        
        self.titleLabel.text = "Entered Beacon Region"
    
        let beaconRegion = region as CLBeaconRegion
        self.uuidLabel.text = beaconRegion.proximityUUID.UUIDString
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        println("Did exit region \(region)")
        
        self.titleLabel.text = "Exited Beacon Region"
        
        let beaconRegion = region as CLBeaconRegion
        self.uuidLabel.text = beaconRegion.proximityUUID.UUIDString
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        println(beacons)
    }
}

