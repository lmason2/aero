//
//  MapAnnotationLocation.swift
//  Aero
//
//  Created by Luke Mason on 1/1/22.
//

import SwiftUI
import MapKit

struct RunLocation: Codable, Identifiable {
    let id: UUID
    let data: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
