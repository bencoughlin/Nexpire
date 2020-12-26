//
//  ViewController.swift
//  Nexpire
//
//  Created by Ben Coughlin on 22/12/2020.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var movies = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    // JSON
    private func getData() {
        // URL
        let url = URL(string:  "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Aexp%3AUK&t=ns&st=adv&p=1")
        
        guard url != nil else {
            print("Error creating url object")
            return
        }
        
        // URL request
        var request = URLRequest(url: url!, cachePolicy:.useProtocolCachePolicy, timeoutInterval: 10.0)
        
        // Specify the header
        let header = [
            "x-rapidapi-key": "49f7a814d4msh40ad16101a77fdcp16ddccjsn6076649099e1",
            "x-rapidapi-host": "unogs-unogs-v1.p.rapidapi.com"
        ]
        
        request.allHTTPHeaderFields = header
        
        // Set request type
        request.httpMethod = "GET"
        
        // Get URL Session
        let session = URLSession.shared
        
        movies.removeAll()
        
        // Create data task
        let dataTask = session.dataTask(with: request) { [self] (data, response, error) in
            
            // Check for errors
            guard let data = data else {
                return
            }
                // Parse JSON
                var result: Nexpire?
                
                do {
                    result = try JSONDecoder().decode(Nexpire.self, from: data)

                }
                catch let error as NSError {
                    print("Error in JSON parsing")
                    print(error)
                }
                
                guard let finalResult = result else {
                    return
                }
                
                let newMovies = finalResult.ITEMS
                movies.append(contentsOf: newMovies)
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            

        }
            
        
        // Fire off data task
        dataTask.resume()
    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(movies.count)
        return movies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
        
    }
}

