import UIKit

public class AccountController : UIViewController, UITextFieldDelegate {
    
    // MARK -- Views
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let inputContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameInputField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.masksToBounds = true
        return textField
    }()
    
    let nameDividerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        return view
    }()
    
    let emailInputField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email address"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailDividerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        return view
    }()
    
    let passwordInputField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let actionButton : UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let segmentedControl : UISegmentedControl = {
        let control = UISegmentedControl(items: ["Login", "Register"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.tintColor = UIColor.white
        control.selectedSegmentIndex = 1
        control.addTarget(self, action: #selector(handleSegmentedControlValueChanged), for: .valueChanged)
        return control
    }()
    
    // MARK -- Dynamic Setup function for playground usage
    // This is not necessary for real world usage. 
    var backgroundColor : UIColor?
    var buttonColor : UIColor?
    var buttonTextColor : UIColor?
    var logo : UIImage?
    
    public func setup(backgroundColor: UIColor?, buttonColor: UIColor?, buttonTextColor: UIColor?, logo: UIImage?) {
        self.backgroundColor = backgroundColor
        self.buttonColor = buttonColor
        self.buttonTextColor = buttonTextColor
        self.logo = logo
    }
    
    override public func viewDidLoad() {
        self.view.backgroundColor = self.backgroundColor
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        self.scrollView.addSubview(self.inputContainerView)
        self.scrollView.addSubview(self.logoImageView)
        self.scrollView.addSubview(self.actionButton)
        self.scrollView.addSubview(self.segmentedControl)
        
        self.nameInputField.delegate = self
        self.emailInputField.delegate = self
        self.passwordInputField.delegate = self
        
        self.loadInputContainerView()
        self.loadSegmentedControl()
        self.loadImageView()
        self.loadActionButton()
        
        self.actionButton.backgroundColor = self.buttonColor
        if (self.buttonTextColor != nil) {
            self.actionButton.setTitleColor(self.buttonTextColor!, for: .normal)
        }
        self.actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    func handleSegmentedControlValueChanged() {
        let title = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        actionButton.setTitle(title, for: .normal)
        
        inputContainerHeightAnchor?.constant = segmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        self.nameInputHeightAnchor?.isActive = false
        self.nameInputHeightAnchor = nameInputField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: segmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        self.nameInputHeightAnchor?.isActive = true
        
        self.emailInputHeightAnchor?.isActive = false
        self.emailInputHeightAnchor = emailInputField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: segmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        self.emailInputHeightAnchor?.isActive = true
        
        self.passwordInputHeightAnchor?.isActive = false
        self.passwordInputHeightAnchor = passwordInputField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: segmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        self.passwordInputHeightAnchor?.isActive = true
    }
    
    var inputContainerHeightAnchor : NSLayoutConstraint?
    var nameInputHeightAnchor : NSLayoutConstraint?
    var emailInputHeightAnchor : NSLayoutConstraint?
    var passwordInputHeightAnchor : NSLayoutConstraint?
    
    func loadInputContainerView() {
        // Container
        inputContainerView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true // Center in view
        inputContainerView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor).isActive = true // Center in view
        inputContainerView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -24).isActive = true
        
        self.inputContainerHeightAnchor = inputContainerView.heightAnchor.constraint(equalToConstant: 150)
            inputContainerHeightAnchor?.isActive = true
        
        inputContainerView.addSubview(nameInputField)
        inputContainerView.addSubview(nameDividerView)
        
        inputContainerView.addSubview(emailInputField)
        inputContainerView.addSubview(emailDividerView)
        
        inputContainerView.addSubview(passwordInputField)
        
        // Name Input Field + Divider
        nameInputField.leftAnchor.constraint(equalTo: self.inputContainerView.leftAnchor, constant: 12).isActive = true
        nameInputField.topAnchor.constraint(equalTo: self.inputContainerView.topAnchor).isActive = true
        nameInputField.widthAnchor.constraint(equalTo: self.inputContainerView.widthAnchor).isActive = true
        
        self.nameInputHeightAnchor = nameInputField.heightAnchor.constraint(equalTo: self.inputContainerView.heightAnchor, multiplier: 1/3)
        self.nameInputHeightAnchor?.isActive = true
        
        nameDividerView.leftAnchor.constraint(equalTo: self.inputContainerView.leftAnchor).isActive = true
        nameDividerView.topAnchor.constraint(equalTo: self.nameInputField.bottomAnchor).isActive = true
        nameDividerView.widthAnchor.constraint(equalTo: self.nameInputField.widthAnchor).isActive = true
        nameDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Email Input Field + Divider
        emailInputField.leftAnchor.constraint(equalTo: self.inputContainerView.leftAnchor, constant: 12).isActive = true
        emailInputField.topAnchor.constraint(equalTo: self.nameDividerView.bottomAnchor).isActive = true
        emailInputField.widthAnchor.constraint(equalTo: self.inputContainerView.widthAnchor).isActive = true
        self.emailInputHeightAnchor = emailInputField.heightAnchor.constraint(equalTo: self.inputContainerView.heightAnchor, multiplier: 1/3)
        emailInputHeightAnchor?.isActive = true
        
        emailDividerView.leftAnchor.constraint(equalTo: self.inputContainerView.leftAnchor).isActive = true
        emailDividerView.topAnchor.constraint(equalTo: self.emailInputField.bottomAnchor).isActive = true
        emailDividerView.widthAnchor.constraint(equalTo: self.emailInputField.widthAnchor).isActive = true
        emailDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Password Input Field
        passwordInputField.leftAnchor.constraint(equalTo: self.inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordInputField.topAnchor.constraint(equalTo: self.emailDividerView.bottomAnchor).isActive = true
        passwordInputField.widthAnchor.constraint(equalTo: self.inputContainerView.widthAnchor).isActive = true
        self.passwordInputHeightAnchor = passwordInputField.heightAnchor.constraint(equalTo: self.inputContainerView.heightAnchor, multiplier: 1/3)
        self.passwordInputHeightAnchor?.isActive = true
    }
    
    func loadImageView() {
        logoImageView.image = self.logo
        logoImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: self.segmentedControl.topAnchor, constant: -50).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -250).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func loadActionButton() {
        actionButton.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: self.inputContainerView.bottomAnchor, constant: 40).isActive = true
        actionButton.widthAnchor.constraint(equalTo: self.inputContainerView.widthAnchor).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func loadSegmentedControl() {
        segmentedControl.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: self.inputContainerView.topAnchor, constant: -35).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -24).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        return true
    }
    
    func actionButtonTapped() {
        self.nameInputField.resignFirstResponder()
        self.emailInputField.resignFirstResponder()
        self.passwordInputField.resignFirstResponder()
        
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
}

public extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
