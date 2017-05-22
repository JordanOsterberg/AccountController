# AccountController
A simple to use class for displaying an account-creation controller.

## Preface
This was created in Swift Playgrounds as a "self-test"-- a way for me to get used to working with constraints in code. Kuddos to [Brian Voong](https://twitter.com/buildthatapp) for giving me the inspriation to try it out, and a basis for some of this code. It is in no way a project without it's share of bugs, so you may need to adapt it to fit your use case.

## Installation
If you'd like to just play around with the project without integrating it into an application, download the entire playground.

Otherwise, download the AccountController.swift file inside the playground. Once downloaded, insert it into your Xcode project and configure + present it like so:
```swift
let controller = AccountController()
controller.setup(backgroundColor: UIColor(r: 61, g: 107, b: 179), buttonColor: UIColor(r: 94, g: 118, b: 188), buttonTextColor: nil, logo: UIImage(named: "facebook"))
present(controller, animated: true, completion: nil)
```
You may need to tweak the constraints in order to get the logo to display properly. This is a known bug and will be fixed soon.

## Examples
### Playground
![Example One](https://raw.githubusercontent.com/JordanOsterberg/AccountController/master/Example1.png)

### Project Integration Example
![Example Two](https://raw.githubusercontent.com/JordanOsterberg/AccountController/master/Example2.gif)

Integration Code:
```swift
func presentAccountController() {
        let controller = AccountController()
        controller.setup(backgroundColor: UIColor(r: 61, g: 107, b: 179), buttonColor: UIColor(r: 94, g: 118, b: 188), buttonTextColor: nil, logo: UIImage(named: "facebook"))
        present(controller, animated: true, completion: nil)
    }
```
It's that easy.

## Bugs
* Some logos require modifications to get them to work as intended 

## License
This project is avaliable under the MIT License.

## Questions?
You can contact me via [email](mailto:jordan.osterberg@shadowsystems.tech) or [twitter](https://www.twitter.com/osterbergjordan)
