import UIKit
final class WrittenWishCell: UITableViewCell {
    
    private let wishLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with wish: String) {
        wishLabel.text = wish
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        let wrap: UIView = UIView()
        addSubview(wrap)
        wrap.backgroundColor = ConstantsStoringView.wrapColor
        wrap.layer.cornerRadius = ConstantsStoringView.wrapRadius
        wrap.pinVertical(to: self, ConstantsStoringView.wrapOffsetV)
        wrap.pinHorizontal(to: self, ConstantsStoringView.wrapOffsetH)
        wrap.addSubview(wishLabel)
        wishLabel.pin(to: wrap, ConstantsStoringView.wishTableOffset)
    }
}
