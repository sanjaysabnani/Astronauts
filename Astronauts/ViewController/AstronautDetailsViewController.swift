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

    var astronaut : Astronaut?
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView(with: astronaut)
    }
    
    
    func setUpView(with astronaut : Astronaut?){
        guard let astronaut = astronaut else {
            return
        }
        
        let astronautDetailsViewModel = AstronautDetailsViewModel(astronaut: astronaut, apiServiceProtocol: APIHelper.shared)
        let imgUrl = astronautDetailsViewModel.profileImageURL
        
        astronautDetailsViewModel.fetchProfileImage(url: imgUrl) { [weak self]image, error in
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            
            }
        }
        
        self.nameLabel.text = astronautDetailsViewModel.name
        self.countryLabel.text = astronautDetailsViewModel.nationality
        self.dobLabel.text = astronautDetailsViewModel.dob
        
        self.bioTextView.text = astronautDetailsViewModel.bio
        
        
    }
    
    deinit {
        print("Deinit AstronautDetailsViewController")
    }
}
