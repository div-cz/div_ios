//
//  ViewController.swift
//  Div_iOS_App
//
//  Created by Christián on 22/07/2024.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        // Do any additional setup after loading the view.
        setupLoginButton()
        setupRegisterButton()
        setupMailField()
        setupPasswordField()
        welcomeImage()
        
    }
}

extension ViewController {

    func welcomeImage() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcomeImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])

        NSLayoutConstraint.activate([
            
        ])
    }

    func setupLoginButton() {
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Pripojenie tlačidla k stredu zobrazenia
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 280),
            // Nastavenie šírky a výšky tlačidla
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupRegisterButton() {
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showFilmsCollection), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Pripojenie tlačidla k stredu zobrazenia
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200),
            // Nastavenie šírky a výšky tlačidla
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupMailField() {
        let textField = UITextField()
        self.view.addSubview(textField)
        textField.placeholder = "Enter mail"
        textField.tintColor = UIColor.red
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20),
            textField.widthAnchor.constraint(equalToConstant: 350),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupPasswordField() {
        let textField = UITextField()
        self.view.addSubview(textField)
        textField.placeholder = "Enter password"
        textField.tintColor = UIColor.red
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 0),
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 80),
            textField.widthAnchor.constraint(equalToConstant: 350),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonTapped() {
            print("Tlačidlo bolo stlačené!")
        }
    @objc func showFilmsCollection() {
        let filmsCollectionVC = FilmsCollectionView()
        filmsCollectionVC.modalPresentationStyle = .fullScreen
        self.present(filmsCollectionVC, animated: true, completion: nil)
    }

}

