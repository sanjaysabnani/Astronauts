//
//  AstronautDetailsViewController.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import UIKit

class AstronautDetailsViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var astronautID : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView(with: astronautID)
    }
    
    
    func setUpView(with astronautID : Int?){
        guard let astronautID = astronautID else {
            return
        }
        
        let astronautDetailsViewModel = AstronautDetailsViewModel(astronautID: astronautID, apiServiceProtocol: APIHelper.shared)
            astronautDetailsViewModel.fetchAstronautDetails {[weak self] astronaut, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    
                }
                
                guard let astronaut = astronaut else { return  }
                
                DispatchQueue.main.async {
                    
                    self?.nameLabel.text = astronaut.name
                    self?.countryLabel.text = "Nationality : \(astronaut.nationality)"
                    self?.dobLabel.text = "DOB : \(astronaut.date_of_birth ??  Constants.Strings.unknown)"
                    self?.bioTextView.text = astronaut.bio
                    
                }
                if let imgUrl = URL(string: astronaut.profile_image!) {
                    
                    astronautDetailsViewModel.fetchProfileImage(url: imgUrl) { [weak self]image, error in
                        DispatchQueue.main.async {
                            self?.activityIndicator.stopAnimating()
                            self?.profileImageView.image = image
                        
                        }
                    }
                }
                
        }
        
        
        
        
    }
    
    deinit {
        print("Deinit AstronautDetailsViewController")
    }
}
