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
        
        
        let astronautCellViewModel = AstronautCellViewModel(astronaut: astronaut, apiServiceProtocol: APIHelper.shared)
        
        let imgUrl = astronautCellViewModel.profileThumbnailImageURL
        
        self.profileImageView.image = UIImage(systemName: "person.crop.circle")
        astronautCellViewModel.fetchThumbnailProfileImage(url: imgUrl) { [weak self] result  in
            
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    self?.profileImageView.image = image
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.activityIndicator.stopAnimating()
                    print(error.localizedDescription)
                }
            }
            
            
        }
        self.nameLabel.text = astronautCellViewModel.name
        self.countryLabel.text = astronautCellViewModel.nationality
        
    }

}

