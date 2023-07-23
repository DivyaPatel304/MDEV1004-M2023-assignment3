//
//  MovieViewController.swift
//  MDEV1004-M2023-assignment3
//
//  Created by Divya Patel on 2023-07-23.
//
import UIKit

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
    }
    
    func fetchMovies() {
        guard let url = URL(string: "https://mdev1004-m2023-first-assignment.onrender.com/api/list") else {
            displayErrorMessage("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                self?.displayErrorMessage(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                self?.displayErrorMessage("Empty response")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode([Movie].self, from: data)
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch {
                self?.displayErrorMessage("Failed to decode JSON")
            }
        }.resume()
    }
    
    func displayErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}
