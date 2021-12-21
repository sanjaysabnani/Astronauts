//
//  ViewController.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import UIKit

class AstronautsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let astronatutsViewModel = AstronautsViewModel(apiServiceProtocol: APIHelper.shared)
    var astronauts = [Astronaut] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    func setUpView(){
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.title = "Astronauts"
        self.navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "sort"), style: .plain, target: self, action: nil), animated: true)
        fetchData()
    }
    func fetchData(){
        
        astronatutsViewModel.getAstronautsList { [weak self]astronauts, error in
            if let error  = error {
                //TO-DO show Alert
                print(error.localizedDescription)
            }
            else {
                self?.astronauts = astronauts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "astronautDetails"){
            let astronautDeailsViewController = segue.destination as? AstronautDetailsViewController
            if let indexPath = sender as? IndexPath {
                astronautDeailsViewController?.astronaut = astronauts[indexPath.row]
            }
            
        }
    }
}

extension AstronautsViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.astronauts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let astronaut =  self.astronauts[indexPath.row]
       
        let astronautCell = self.tableView.dequeueReusableCell(withIdentifier: "astronautCell", for: indexPath) as! AstronautCell
                
        astronautCell.setUpView(with: astronaut)
                
        return astronautCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "astronautDetails", sender: indexPath)

    }
    
}
