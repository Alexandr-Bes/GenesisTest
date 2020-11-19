//
//  RepositoryView.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//
//

import UIKit

final class RepositoryView: UIViewController {
    
    var presenter: RepositoryViewOutputProtocol?
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

//MARK: - Private 
private extension RepositoryView {
    func setupUI() {
        view.addSubview(tableView)
    }
}

// MARK: - UITableView Delegate & Data Source
extension RepositoryView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }
}
