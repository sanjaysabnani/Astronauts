//
//  AstronautCell.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import UIKit

class AstronautCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
    }

    func setUpView(with astronaut : Astronaut){
        
        
        let astronautCellViewModel = AstronautDetailsViewModel(astronaut: astronaut, apiServiceProtocol: APIHelper.shared)
        let imgUrl = astronautCellViewModel.profileThumbnailImageURL
        
        astronautCellViewModel.fetchProfileImage(url: imgUrl) { [weak self] image, error in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.profileImageView.image = image
                
            }
        }
        self.nameLabel.text = astronautCellViewModel.name
        self.countryLabel.text = astronautCellViewModel.nationality
        
    }

}

