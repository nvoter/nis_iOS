//
//  WishMakerViewController.swift
//  avmanushkinaPW2
//
//  Created by Анастасия on 06.10.2023.
//

import UIKit
final class WishMakerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    enum Constants {
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        static let stackRadius: CGFloat = 20
        static let stackBottom: CGFloat = -40
        static let stackLeading: CGFloat = 20
        static let fontSize: CGFloat = 32
        static let topAnchorConstant: CGFloat = 30
        static let trailingAnchorConstant: CGFloat = -20
        static let descriptionFontSize: CGFloat = 18
        static let titleText: String = "WishMaker"
        static let descriptionText: String = "The background color can be changed by sliders"
        static let numberOfLines: Int = 0
        static let defaultValue: CGFloat = 0
        static let alphaValue: CGFloat = 1
    }
    
    private func configureUI() {
        view.backgroundColor = .cyan
        configureTitle();
        configureSliders()
        configureDescription()
    }
    
    var redColor = Constants.defaultValue
    var greenColor = Constants.defaultValue
    var blueColor = Constants.defaultValue
    
    func changeColor() {
        view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: Constants.alphaValue)
    }
    
    private func configureSliders() {
         let stack = UIStackView()
         stack.translatesAutoresizingMaskIntoConstraints = false
         stack.axis = .vertical
         view.addSubview(stack)
         stack.layer.cornerRadius = Constants.stackRadius
         stack.clipsToBounds = true
         let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
         let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
         let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
         for slider in [sliderRed, sliderGreen, sliderBlue] {
         stack.addArrangedSubview(slider)
         }
         NSLayoutConstraint.activate([
         stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
         stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
         ])
        
        sliderRed.valueChanged = { [weak self] value in
            self?.redColor = value
            self?.changeColor()
        }
        sliderGreen.valueChanged = { [weak self] value in
            self?.greenColor = value
            self?.changeColor()
        }
        sliderBlue.valueChanged = { [weak self] value in
            self?.blueColor = value
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
}


final class CustomSlider: UIView {
    enum Constants {
        static let topAnchorConstant: CGFloat = 10
        static let leadingAnchorConstant: CGFloat = 20
        static let bottomAnchorConstant: CGFloat = -10
    }
    var valueChanged: ((Double) -> Void)?
    
    var slider = UISlider()
    var titleView = UILabel()
    
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topAnchorConstant),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingAnchorConstant),
            
            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.bottomAnchorConstant),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingAnchorConstant)
        ])
    }
    
    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
    
}
