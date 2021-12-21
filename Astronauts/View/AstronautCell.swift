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
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius = 25.0
    }

    func setUpView(with astronaut : Astronaut){
        let astronautCellViewModel = AstronautCellViewModel(astronaut: astronaut, apiServiceProtocol: APIHelper.shared)
        
        self.nameLabel.text = astronautCellViewModel.name
        self.countryLabel.text = astronautCellViewModel.nationality
        astronautCellViewModel.fetchProfileImage { [weak self] image, error in
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            
            }
        }
    }

}

