//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let window = UIWindow(frame: sizeFor(device: .iphonePlus))
window.makeKeyAndVisible()

let controller = AccountController()
controller.setup(backgroundColor: UIColor(r: 61, g: 107, b: 179), buttonColor: UIColor(r: 94, g: 118, b: 188), buttonTextColor: nil, logo: UIImage(named: "facebook")) // Facebook theme
window.rootViewController = controller

PlaygroundPage.current.liveView = window
