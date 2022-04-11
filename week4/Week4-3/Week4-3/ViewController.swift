//
//  ViewController.swift
//  Week4-3
//
//  Created by Boray Chen on 2022/4/11.
//

import UIKit

class ViewController: UIViewController {

    let url = "https://stations-98a59.firebaseio.com/practice.json"
    
    private let stationIDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "loading ID"
        return label
    }()
    
    private let stationNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading"
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "loading Address"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        fetchStationInfo { [weak self] station in
            guard let self = self else { return }
            self.stationIDLabel.text = station.id
            self.stationNameLabel.text = station.name
            self.addressLabel.text = station.address
        }
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stationIDLabel)
        view.addSubview(stationNameLabel)
        view.addSubview(addressLabel)
        
        NSLayoutConstraint.activate([
            stationIDLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stationIDLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stationNameLabel.topAnchor.constraint(equalTo: stationIDLabel.bottomAnchor, constant: 35),
            stationNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stationNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }

    func fetchStationInfo(completion: @escaping (Station) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let station = try JSONDecoder().decode(Station.self, from: data)
                
                DispatchQueue.main.async {
                    completion(station)
                }
            }catch {
                print(error)
            }
    
        }.resume()
    }
}

