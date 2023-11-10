import UIKit
enum Constants {
    static let sliderMin: Double = 0
    static let sliderMax: Double = 1
    static let red: String = "Red"
    static let green: String = "Green"
    static let blue: String = "Blue"
    static let stackRadius: CGFloat = 20
    static let stackBottom: CGFloat = -110
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
enum ConstantsCustomSlider {
    static let topAnchorConstant: CGFloat = 10
    static let leadingAnchorConstant: CGFloat = 20
    static let bottomAnchorConstant: CGFloat = -25
}
enum ConstantsAddWishButton{
    static let buttonHeight: CGFloat = 50
    static let buttonBottom: CGFloat = 40
    static let buttonSide: CGFloat = 20
    static let buttonText: String = "Write a wish"
    static let buttonRadius: CGFloat = 15
}
enum ConstantsTable{
    static let tableCornerRadius: CGFloat = 15
    static let tableOffset: CGFloat = 40
}
enum ConstantsStoringView {
    static let wrapColor: UIColor = .white
    static let wrapRadius: CGFloat = 5
    static let wrapOffsetV: CGFloat = 5
    static let wrapOffsetH: CGFloat = 10
    static let wishTableOffset: CGFloat = 15
    static let sectionsNumber: Int = 2
    static let background: UIColor = .white
    static let tableBackground: UIColor = .systemIndigo
    static let zero: Int = 0
    static let key: String = "WishArrayKeys"
    static let addWishCells: Int = 1
    static let buttonAnchor: CGFloat = 700
    static let buttonWidth: CGFloat = 294
    static let clearAllButtonTitle: String = "Clear all"
    static let clearAllButtonColor: UIColor = .red
    static let clearAllButtonBackground: UIColor = .white
}
enum ConstantsWrittenWishCell {
    static let reuseId: String = "WrittenWishCell"
}
enum ConstantsAddWishCell {
    static let wrapRadius: CGFloat = 16
    static let wrapOffsetH: CGFloat = 10
    static let wrapHeight: Double = 150
    
    static let wishTextTop: Double = 10
    static let wishTextRadius: Double = 10
    static let wishTextHeight: Double = 100
    
    static let addWishButtonTop: Double = 5
    static let addWishButtonTitle: String = "Add a wish"
    static let addWishButtonRadius: Double = 10
    static let addWishButtonWidth: Double = 50
    static let addWishButtonHeight: Double = 25
    static let addWishCellReuseId: String = "AddWishCell"
}
