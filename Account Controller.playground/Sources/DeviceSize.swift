import Foundation
import UIKit

public func sizeFor(device: Device) -> CGRect {
    if (device == .iphonePlus) {
        return CGRect(x: 0, y: 0, width: 414, height: 736)
    } else if (device == .ipad) {
        return CGRect(x: 0, y: 0, width: 1536, height: 2048)
    } else if (device == .large) {
        return CGRect(x: 0, y: 0, width: 750, height: 750)
    }
    
    return CGRect(x: 0, y: 0, width: 500, height: 1000)
}

public enum Device {
    case iphonePlus
    case ipad
    case large
    case none
}
