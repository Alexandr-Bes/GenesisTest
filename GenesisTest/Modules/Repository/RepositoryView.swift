//
//  RepositoryView.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//
//

import UIKit

final class RepositoryView: UIViewController {
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension RepositoryView {
    func setupUI() {
        
    }
}

extension RepositoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
