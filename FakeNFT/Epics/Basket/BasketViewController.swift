import UIKit
import ProgressHUD

final class BasketViewController: UIViewController {
    
    private lazy var sortButton: UIButton = {
        let button = UIButton.systemButton(with: UIImage(named: "sort")!, target: self, action: #selector(didTapSortButton))
        return button
    }()
    
    private let sumView = SumView()
    
    //    private lazy var nftsTableView: UITableView = {
    //        let tableView = UITableView()
    //        tableView.backgroundColor = .clear
    //        tableView.separatorStyle = .none
    //        tableView.allowsSelection = false
    //        tableView.dataSource = self
    //        tableView.register(BusketNFTCell.self)
    //        return tableView
    //    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    ////        ProgressHUD.show()
    //    }
    //
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //    }
    
    @objc
    private func didTapSortButton() {
        // TODO: добавить сортировку
    }
}

private extension BasketViewController {
    
    //    func setupNavBar() {
    //        navigationController?.navigationBar.tintColor = .black
    //        navigationItem.rightBarButtonItem = sortButton
    //    }
    
    func setupView() {
        view.backgroundColor = .white
        [sumView, sortButton]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        view.addSubview(sortButton)
        view.addSubview(sumView)
        //        view.addSubview(nftsTableView)
        //        setupNavBar()
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sortButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            sortButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 15),
            
            sumView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sumView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sumView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // nftsTableView
            //            nftsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            //            nftsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //            nftsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            //            nftsTableView.bottomAnchor.constraint(equalTo: sum.topAnchor)
        ])
    }
    
}

extension BasketViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            return
    //        }
    
}

extension BasketViewController: BasketNFTCellDelegate {
    
    func didTapRemoveButton(on nft: NFTModel) {
        let removeNFTViewController = RemoveNFTViewController()
        removeNFTViewController.delegate = self
        removeNFTViewController.configure(with: nft)
        removeNFTViewController.modalPresentationStyle = .overFullScreen
        removeNFTViewController.modalTransitionStyle = .crossDissolve
        present(removeNFTViewController, animated: true)
    }
}

extension BasketViewController: RemoveNFTViewControllerDelegate {
    
    func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    func didTapConfirmButton(_ model: NFTModel) {
    }
}
