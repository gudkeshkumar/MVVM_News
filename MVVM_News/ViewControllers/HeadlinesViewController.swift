//
//  HeadlinesViewController.swift
//  MVVM_News
//
//  Created by apple on 30/05/21.
//

import UIKit

final class HeadlinesViewController: UITableViewController {
    
    private var headLinesViewModel: HeadlinesListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7c825cfc717446c48f18112aadcfd7b0")!
        HeadlinesFetcher().getHeadlines(url: url) { articles in
            self.headLinesViewModel = HeadlinesListViewModel(articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension HeadlinesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard headLinesViewModel != nil else { return 0 }
        return headLinesViewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineTableViewCell", for: indexPath) as? HeadlineTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = headLinesViewModel.headline(at: indexPath.row)
        cell.titleLabel.text = viewModel?.title
        cell.descriptionLabel.text = viewModel?.description
        return cell
    }
}

