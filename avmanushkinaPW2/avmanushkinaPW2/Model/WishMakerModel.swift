import UIKit
final class WishMakerModel{
    var redColor = Constants.defaultValue
    var greenColor = Constants.defaultValue
    var blueColor = Constants.defaultValue
    let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
    let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
    let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
    public let addWishButton: UIButton = UIButton(type: .system)
}
