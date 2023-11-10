import UIKit

final class AddWishCell: UITableViewCell {
    private let wishText: UITextView = UITextView()
    private let addWishButton: UIButton = UIButton(type: .system)
    private var addWish: ((String) -> ())?
    public var wishContent : String {
        get {
            wishText.text
        }
        set (newText) {
            wishText.text = newText
        }
    }
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(action: @escaping (String) -> ()) {
        addWish = action
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        
        wrap.isUserInteractionEnabled = true
        wrap.backgroundColor = .clear
        wrap.layer.cornerRadius = ConstantsAddWishCell.wrapRadius
        wrap.pin(to: contentView)
        wrap.addSubview(wishText)
        wrap.addSubview(addWishButton)
        wrap.setHeight(ConstantsAddWishCell.wrapHeight)
        
        wishText.pinHorizontal(to: wrap, ConstantsAddWishCell.wrapOffsetH)
        wishText.pinTop(to: wrap, ConstantsAddWishCell
            .wishTextTop)
        wishText.setHeight(ConstantsAddWishCell.wishTextHeight)
        wishText.layer.cornerRadius = ConstantsAddWishCell.wishTextRadius
        
        addWishButton.setTitle(ConstantsAddWishCell.addWishButtonTitle, for: .normal)
        addWishButton.setTitleColor(.black, for: .normal)
        addWishButton.backgroundColor = .white
        addWishButton.centerXAnchor.constraint(equalTo: wishText.centerXAnchor).isActive = true
        addWishButton.layer.cornerRadius = ConstantsAddWishCell.addWishButtonRadius
        addWishButton.pinTop(to: wishText.bottomAnchor, ConstantsAddWishCell.addWishButtonTop)
        addWishButton.pinRight(to: wishText)
        addWishButton.setWidth(ConstantsAddWishCell.addWishButtonWidth)
        addWishButton.setHeight(ConstantsAddWishCell.addWishButtonHeight)
        addWishButton.addTarget(self, action: #selector(addWishButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func addWishButtonTapped() {
        addWish?(wishText.text)
        wishText.text = String()
    }
}
