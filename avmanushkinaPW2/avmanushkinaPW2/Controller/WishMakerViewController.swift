//
//  WishMakerViewController.swift
//  avmanushkinaPW2
//
//  Created by Анастасия on 06.10.2023.
//

import UIKit
final class WishMakerViewController: UIViewController {
    
    let wishMakerModel = WishMakerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .cyan
        configureTitle()
        configureSliders()
        configureDescription()
        configureAddWishButton()
    }
    
    func changeColor() {
        view.backgroundColor = UIColor(red: wishMakerModel.redColor, green: wishMakerModel.greenColor, blue: wishMakerModel.blueColor, alpha: Constants.alphaValue)
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        for slider in [wishMakerModel.sliderRed, wishMakerModel.sliderGreen, wishMakerModel.sliderBlue] {
            stack.addArrangedSubview(slider)
        }
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom),
            
        ])
        
        wishMakerModel.sliderRed.valueChanged = { [weak self] value in
            self?.wishMakerModel.redColor = value
            self?.changeColor()
        }
        wishMakerModel.sliderGreen.valueChanged = { [weak self] value in
            self?.wishMakerModel.greenColor = value
            self?.changeColor()
        }
        wishMakerModel.sliderBlue.valueChanged = { [weak self] value in
            self?.wishMakerModel.blueColor = value
            self?.changeColor()
        }
    }
    
    private func configureTitle() {
        let title = UILabel() // make it a private field titleView above viewDidLoad()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = Constants.titleText
        title.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        title.textColor = .black
        view.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.topAnchorConstant)
        ])
    }
    
    private func configureDescription() {
        let title = view.subviews.first
        
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = Constants.descriptionText
        description.lineBreakMode = NSLineBreakMode.byWordWrapping
        description.numberOfLines = Constants.numberOfLines
        description.font = UIFont.boldSystemFont(ofSize: Constants.descriptionFontSize)
        description.textColor = .black
        
        view.addSubview(description)
        
        NSLayoutConstraint.activate([
            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            description.topAnchor.constraint(equalTo: title!.bottomAnchor, constant: Constants.stackLeading),
            description.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingAnchorConstant)
        ])
    }
    private func configureAddWishButton() {
        view.addSubview(wishMakerModel.addWishButton)
        wishMakerModel.addWishButton.setHeight(ConstantsAddWishButton.buttonHeight)
        wishMakerModel.addWishButton.pinBottom(to: view, ConstantsAddWishButton.buttonBottom)
        wishMakerModel.addWishButton.pinHorizontal(to: view, ConstantsAddWishButton.buttonSide)
        wishMakerModel.addWishButton.backgroundColor = .white
        wishMakerModel.addWishButton.setTitleColor(.systemPink, for: .normal)
        wishMakerModel.addWishButton.setTitle(ConstantsAddWishButton.buttonText, for: .normal)
        wishMakerModel.addWishButton.layer.cornerRadius = ConstantsAddWishButton.buttonRadius
        wishMakerModel.addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    @objc
    private func addWishButtonPressed() {
        present(WishStoringViewController(), animated: true)
    }
}
