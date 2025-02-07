import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{
    var name: String
    var category: String
    var city: String
    var state: String
    var id: Int
    var isFeatured: Bool
    var isFavorite: Bool
    var park: String
    var coordinates: Coordinates
    var description: String
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
