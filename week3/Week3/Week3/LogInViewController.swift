//
//  ViewController.swift
//  Week3
//
//  Created by Boray Chen on 2022/4/4.
//

import UIKit

enum EntryFlowType: Int {
    case login
    case signup
}

enum LoginError: Error {
    case emptyAccount
    case emptyPassword
    case emptyCheckPassword
    case loginFail
    case signupFail
    
    var description: String {
        switch self {
        case .emptyAccount:
            return "Account should not be empty"
        case .emptyPassword:
            return "Password should not be empty"
        case .emptyCheckPassword:
            return "Check Password should not be empty"
        case .loginFail:
            return "Login fail"
        case .signupFail:
            return "Signup fail"
        }
    }
}

class LoginViewController: UIViewController {

    // MARK: - Properties
    
    private let correctAccount = "appworks_school@gmail.com"
    private let correctPassword = "1234"
    
    private var flowType: EntryFlowType = .login
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "AppWorks School"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var loginSigninSegmentedControl: UISegmentedControl = {
       let sg = UISegmentedControl(items: ["Log In", "Sign Up" ])
        sg.translatesAutoresizingMaskIntoConstraints = false
        sg.selectedSegmentIndex = 0
        sg.selectedSegmentTintColor = .black
        sg.backgroundColor = .white
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        sg.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        return sg
    }()
    
    private let grayView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let accountLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var accountTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.delegate = self
        tf.layer.cornerRadius = 5
        tf.returnKeyType = .next
        
        return tf
    }()
    
    private let passwordLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.delegate = self
        tf.layer.cornerRadius = 5

        return tf
    }()
    
    private let checkLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Check"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkTextField: UITextField = {
       let tf = UITextField()
        tf.isEnabled = false
        tf.backgroundColor = .darkGray
        tf.layer.cornerRadius = 5
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.delegate = self
        tf.returnKeyType = .done
        
        return tf
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }


    // MARK: - functions
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(loginSigninSegmentedControl)
        view.addSubview(grayView)
        view.addSubview(actionButton)
        
        let textFieldVstack = UIStackView(arrangedSubviews: [ accountTextField, passwordTextField, checkTextField ])
        textFieldVstack.translatesAutoresizingMaskIntoConstraints = false
        textFieldVstack.distribution = .fillEqually
        textFieldVstack.axis = .vertical
        textFieldVstack.spacing = 5
        
        let labelVstack = UIStackView(arrangedSubviews: [accountLabel, passwordLabel, checkLabel])
        accountLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        passwordLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        checkLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        labelVstack.spacing = 5
        labelVstack.translatesAutoresizingMaskIntoConstraints = false
        labelVstack.distribution = .fillEqually
        labelVstack.axis = .vertical
        
        let hstack = UIStackView(arrangedSubviews: [labelVstack, textFieldVstack])
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.axis = .horizontal
        hstack.spacing = 5
        grayView.addSubview(hstack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginSigninSegmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            loginSigninSegmentedControl.widthAnchor.constraint(equalToConstant: 150),
            loginSigninSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            grayView.topAnchor.constraint(equalTo: loginSigninSegmentedControl.bottomAnchor, constant: 40),
            grayView.widthAnchor.constraint(equalToConstant: 255),
            grayView.heightAnchor.constraint(equalToConstant: 125),
            grayView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hstack.topAnchor.constraint(equalTo: grayView.topAnchor, constant: 5),
            hstack.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 5),
            hstack.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -5),
            hstack.bottomAnchor.constraint(equalTo: grayView.bottomAnchor, constant: -5),
            
            actionButton.topAnchor.constraint(equalTo: grayView.bottomAnchor, constant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 235),
            actionButton.heightAnchor.constraint(equalToConstant: 30),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    @objc func actionButtonTapped() {
        // check login state
//        guard let account = accountTextField.text, let passsword = passwordTextField.text, let checkingPassword = checkTextField.text, !account.isEmpty, !passsword.isEmpty, !checkingPassword.isEmpty else { return }
        
        switch flowType {
        case .login:
            // perform login
            do {
                try login(completion: { isSucceeded in
                    if isSucceeded {
                        print("Login Succeeds")
                    }
                })
            } catch LoginError.loginFail {
                Alert.show(title: LoginError.loginFail.description, message: "", in: self)
            } catch {
                print(error)
                break
            }
        case .signup:
            // perform sign up
            do {
                try signup()
                print("SignUp Succeeds")
            } catch LoginError.emptyAccount {
                Alert.show(title: LoginError.emptyAccount.description, message: nil, in: self)
            } catch LoginError.emptyPassword {
                Alert.show(title: LoginError.emptyPassword.description, message: nil, in: self)
            } catch LoginError.emptyCheckPassword {
                Alert.show(title: LoginError.emptyCheckPassword.description, message: nil, in: self)
            } catch LoginError.signupFail {
                Alert.show(title: LoginError.signupFail.description, message: nil, in: self)
            } catch {
                print(error)
                break
            }
        }
        
    }
    
    @objc func segmentedControlDidChange() {
        
        if loginSigninSegmentedControl.selectedSegmentIndex == 0 {
            flowType = .login
            checkLabel.textColor = .lightGray
            checkTextField.isEnabled = false
            checkTextField.backgroundColor = .darkGray
        }else {
            flowType = .signup
            passwordTextField.returnKeyType = .next
            checkLabel.textColor = .black
            checkTextField.isEnabled = true
            checkTextField.backgroundColor = .white
        }
    }
    
    private func login(completion: ((Bool) -> Void)? = nil) throws {
    
        guard let account = accountTextField.text, let password = passwordTextField.text, !account.isEmpty, !password.isEmpty else { return }
        
        if account != correctAccount || password != correctPassword {
            completion?(false)
            throw LoginError.loginFail
        }
        
        completion?(true)
    }
    

    private func signup() throws {
        guard let account = accountTextField.text, let password = passwordTextField.text, let checkingPassword = checkTextField.text else{ return }
        
        if account.isEmpty {
            throw LoginError.emptyAccount
        }else if password.isEmpty {
            throw LoginError.emptyPassword
        }else if checkingPassword.isEmpty {
            throw LoginError.emptyCheckPassword
        }else if checkingPassword != password {
            throw LoginError.signupFail
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == accountTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField && flowType == .signup {
            checkTextField.becomeFirstResponder()
        }else if textField == passwordTextField && flowType == .login {
            textField.resignFirstResponder()
            return true
        }else if textField == checkTextField {
            textField.resignFirstResponder()
        }
        
        return false
    }
}



