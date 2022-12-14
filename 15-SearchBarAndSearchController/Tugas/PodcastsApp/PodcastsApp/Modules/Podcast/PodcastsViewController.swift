import UIKit
import Kingfisher

class PodcastsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var searchTime: Timer?
    
    let viewModel = PodcastsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        getCoreDataDBPath()
    }
    
    func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        print("PRINT: Core Data DB Path :: \(path ?? "Not fount")")
    }
    
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // MARK: Search Bar
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        
        
    }
    
    func searchPodcasts(q: String) {
        searchTime?.invalidate()
        searchTime = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] (timer) in
            self?.viewModel.searchPodcasts(q: q) { [weak self] (result) in
                self?.tableView.reloadData()
            }
        })
    }
}

// MARK: - UISearchBarDele gate
extension PodcastsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text, text.count >= 3 {
            searchPodcasts(q: text)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text.count >= 3 {
            searchPodcasts(q: text)
        }
    }
}

// MARK: - UITableViewDataSource
extension PodcastsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPodcasts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcastCellId", for: indexPath) as! PodcastViewCell
        
        let index = indexPath.row
        cell.nameLabel.text = viewModel.podcastTrackName(at: index)
        cell.artistLabel.text = viewModel.podcastArtistName(at: index)
        cell.episodeLabel.text = viewModel.podcastTrackCount(at: index)
        cell.thumbImageView.kf.setImage(with: URL(string: viewModel.podcastImagUrl(at: index))) { (result) in
            switch result {
            case.success:
                cell.thumbImageView.contentMode = .scaleAspectFill
                
            case.failure:
                cell.thumbImageView.contentMode = .center
                cell.thumbImageView.image = UIImage(systemName: "photo")
                
            }
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PodcastsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let index = indexPath.row
        let isFavorited = viewModel.isFavorited(at: index)
        let title =  isFavorited ? "Unfavorite": "Favorite"
       
        let favorite = UIContextualAction(style: .normal, title: title, handler: { (_, _, completion) in
            
            if isFavorited {
                self.viewModel.deleteToFavorite(at: index)
                let alert = UIAlertController(title: "Success", message: "Successfully un-favorite podcast.", preferredStyle: .alert)
                    alert.view.backgroundColor = .black
                    alert.view.alpha = 0.5
                    alert.view.layer.cornerRadius = 15
                    self.present(alert, animated: true)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { alert.dismiss(animated: true) }
            }
            else {
                self.viewModel.addToFavorite(at: index)
                let alert = UIAlertController(title: "Success", message: "Successfully favorite podcast.", preferredStyle: .alert)
                    alert.view.backgroundColor = .black
                    alert.view.alpha = 0.5
                    alert.view.layer.cornerRadius = 15
                    self.present(alert, animated: true)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { alert.dismiss(animated: true) }
            }
            
            completion(true)
        })
        
        if isFavorited {
            favorite.image = UIImage(systemName: "star.slash.fill")
            favorite.backgroundColor = UIColor.systemRed
        }
        else {
            favorite.image = UIImage(systemName: "star.fill")
            favorite.backgroundColor = UIColor.systemYellow
        }
        
        let actions = UISwipeActionsConfiguration(actions: [favorite])
        return actions
    }
    
   
}


