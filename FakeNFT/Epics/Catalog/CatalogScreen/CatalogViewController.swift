//
//  CatalogViewController.swift
//  FakeNFT
//
//  Created by Богдан Полыгалов on 01.08.2023.
//

import UIKit

final class CatalogViewController: UIViewController {
    let sortButton = UIButton() // возможно в презентер
    let table = UITableView() // возможно в презентер
    
    var catalogData: [CatalogDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypWhite // возможно в презентер
        configureButton() // возможно в презентер
        configureTable() // возможно в презентер
    }
    
    private func configureButton() { // возможно в презентер
        sortButton.setImage(UIImage.sortButton?.withTintColor(.ypBlack), for: .normal)
        
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sortButton)
        NSLayoutConstraint.activate([
            sortButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -9),
            sortButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sortButton.heightAnchor.constraint(equalToConstant: 42),
            sortButton.widthAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    private func configureTable() { // возможно в презентер
        if !view.contains(sortButton) { return }
        
        table.backgroundColor = .clear
        table.separatorStyle = .none
        
        table.register(CatalogTableCell.self, forCellReuseIdentifier: CatalogTableCell.cellReuseIdentifier)
        table.dataSource = self
        table.delegate = self
        
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            table.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: 20),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catalogData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CatalogTableCell.cellReuseIdentifier)
        guard let catalogCell = cell as? CatalogTableCell else { return UITableViewCell() }
        catalogCell.selectionStyle = .none
        
        let data = catalogData[indexPath.row]
        
        //временно
        catalogCell.setImage(link: data.imageLink)
        catalogCell.setLabel(collectionName: data.name, collectionCount: data.nfts.count)
        
        return catalogCell
    }
}

extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        187
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}