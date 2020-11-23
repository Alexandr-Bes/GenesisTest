//
//  RepositoryView.swift
//  GenesisTest
//
//  Created by Alex Bezkopylnyi on 06.10.2020.
//
//

import UIKit
import RxSwift

final class RepositoryView: UIViewController {
    
    //MARK: - Properties
    
    var presenter: RepositoryViewOutputProtocol?
    private var results: [RepoQuery.Data.Search.Edge?]? = nil
    let disposeBag = DisposeBag()
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Repositories"
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        return searchBar
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

// MARK: - Private Methods

private extension RepositoryView {
    func setupUI() {
        navigationItem.titleView = searchBar
        view.addSubview(tableView)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.addConstraintsToSafeAreaWithoutBottom()
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - View Input

extension RepositoryView: RepositoryViewInputProtocol {
    func showRepositories(with data: [RepoQuery.Data.Search.Edge?]?) {
        results = data
        tableView.reloadData()
    }
    
    func showError(message: String) {
        print(message)
    }
}

// MARK: - UITableView Delegate & Data Source

extension RepositoryView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let data = results else {
            return UITableViewCell()
        }
        cell.textLabel?.text = data[indexPath.row]?.node?.asRepository?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }
}

// MARK: - UISearchBarDelegate

extension RepositoryView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        
        // TODO: - Stop Search?
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // TODO: - Presenter -> user text
        guard let text = searchBar.text, !text.isEmpty else {
            return
        }
        presenter?.searchRepositories(with: text.capitalized)
        print(text.capitalized)
    }
}
