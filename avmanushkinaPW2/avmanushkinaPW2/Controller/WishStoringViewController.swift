import UIKit

final class WishStoringViewController: UIViewController {
    
    private let defaults = UserDefaults.standard
    private var table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = []
    private let clearAllButton: UIButton = UIButton(type: .system)
    override func viewDidLoad() {
        view.backgroundColor = ConstantsStoringView.tableBackground
        configureTable()
        wishArray = defaults.array(forKey: ConstantsStoringView.key) as? [String] ?? []
    }
    
    private func configureTable() {
        view.addSubview(table)
        view.addSubview(clearAllButton)
        clearAllButton.setTitle(ConstantsStoringView.clearAllButtonTitle, for: .normal)
        clearAllButton.setTitleColor(ConstantsStoringView.clearAllButtonColor, for: .normal)
        clearAllButton.backgroundColor = ConstantsStoringView.clearAllButtonBackground
        clearAllButton.layer.cornerRadius = ConstantsAddWishCell.addWishButtonRadius
        clearAllButton.setHeight(ConstantsAddWishCell.addWishButtonHeight)
        clearAllButton.centerXAnchor.constraint(equalTo: self.table.centerXAnchor).isActive = true
        clearAllButton.bottomAnchor.constraint(equalTo: self.table.topAnchor, constant: ConstantsStoringView.buttonAnchor).isActive = true
        clearAllButton.widthAnchor.constraint(equalToConstant: ConstantsStoringView.buttonWidth).isActive = true
        clearAllButton.addTarget(self, action: #selector(clearAllButtonTapped), for: .touchUpInside)
        table.backgroundColor = ConstantsStoringView.tableBackground
        table.dataSource = self
        table.layer.cornerRadius = ConstantsTable.tableCornerRadius
        table.register(WrittenWishCell.self, forCellReuseIdentifier: ConstantsWrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: ConstantsAddWishCell.addWishCellReuseId)
        table.pin(to: view, ConstantsTable.tableOffset)
    }
    @objc
    func clearAllButtonTapped() {
        while (!wishArray.isEmpty){
            wishArray.popLast()
        }
        self.table.reloadData()
        self.defaults.set(self.wishArray, forKey: ConstantsStoringView.key)
    }
}

extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == ConstantsStoringView.zero {
            return ConstantsStoringView.addWishCells
        }
        return wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == ConstantsStoringView.zero {
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantsAddWishCell.addWishCellReuseId, for: indexPath)
            guard let addWishCell = cell as? AddWishCell else { return cell }
            addWishCell.configure(action: {[weak self] wish in
                if wish.isEmpty {
                    return
                }
                self?.wishArray.append(wish)
                self?.table.reloadData()
                self?.defaults.set(self?.wishArray, forKey: ConstantsStoringView.key)
            })
            
            return addWishCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantsWrittenWishCell.reuseId, for: indexPath)
        guard let wishCell = cell as? WrittenWishCell else { return cell }
        wishCell.configure(with: wishArray[indexPath.row])
        
        return wishCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ConstantsStoringView.sectionsNumber
    }
}
