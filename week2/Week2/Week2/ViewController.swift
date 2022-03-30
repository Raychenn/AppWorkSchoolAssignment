//
//  ViewController.swift
//  Week2
//
//  Created by Boray Chen on 2022/3/28.
//

import UIKit

class ViewController: UIViewController {

    let text = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text.",
    "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
    "looked up one of the more obscure Latin words, consectetur",
    "from a Lorem Ipsum passage, and going through the cities of the word",
    "This book is a treatise on the theory of ethics, very popular during the.",
    "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
    ]
    
    let colorSets: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Did you know?"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let contentLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "You are born with 300 bones; by the time you are an adult you will have 206"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let funFactButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Show Another Fun Fact", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAnotherFunFact), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }


    // MARK: - functions
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        
        view.addSubview(titleLabel)
        view.addSubview(contentLabel)
        view.addSubview(funFactButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            funFactButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            funFactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            funFactButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    @objc func showAnotherFunFact() {
        // way 1
//        let randomNumber = Int.random(in: 0...text.count-1)
//        let randomText2 = self.text[randomNumber]
        
        let randomText = self.text.randomElement() 
        guard let randomColor = self.colorSets.randomElement() else { return }
        
        contentLabel.text = randomText
        view.backgroundColor = randomColor
    }
}

