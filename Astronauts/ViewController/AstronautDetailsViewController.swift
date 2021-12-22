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
            astronautDetailsViewModel.fetchAstronautDetails {[weak self] result in
                
                switch result {
                    
                case .success(let astronaut):
                    DispatchQueue.main.async {
                        
                        self?.nameLabel.text = astronaut.name
                        self?.countryLabel.text = "Nationality : \(astronaut.nationality)"
                        self?.dobLabel.text = "DOB : \(astronaut.date_of_birth ??  Constants.Strings.unknown)"
                        self?.bioTextView.text = astronaut.bio
                    }
                    
                    if let imgUrl = URL(string: astronaut.profile_image!) {
                        
                        astronautDetailsViewModel.fetchProfileImage(url: imgUrl) { [weak self] result in
                            switch result {
                            case .success(let image):
                                DispatchQueue.main.async {
                                    self?.activityIndicator.stopAnimating()
                                    self?.profileImageView.image = image
                                
                                }
                            case .failure(let error):
                                DispatchQueue.main.async {
                                    self?.showAlert(title: Constants.Strings.error, message: Constants.Strings.unableToDownloadImg + error.localizedDescription)
                                    self?.activityIndicator.stopAnimating()
                                    print(error.localizedDescription)
                                }
                                
                            }
                            
                            
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.activityIndicator.stopAnimating()
                        self?.showAlert(title: Constants.Strings.error, message: Constants.Strings.unableToFetchDetails + error.localizedDescription)
                            print(error.localizedDescription)

                    }
                    
                }
        }
    }
    
    deinit {
        print("Deinit AstronautDetailsViewController")
    }
}
