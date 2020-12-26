//
//  MovieTableViewCell.swift
//  Nexpire
//
//  Created by Ben Coughlin on 23/12/2020.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieExpiryDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static let identifier = "MovieTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    func configure(with model: Film) {
        self.movieTitleLabel.text = model.title
        self.movieExpiryDate.text = model.unogsdate
        let url = model.image
        do {
            let data = try Data(contentsOf: URL(string: url)!)
            self.moviePosterImageView.image = UIImage(data: data)
        } catch {
            print(error)
        }
        
    }
    
}
