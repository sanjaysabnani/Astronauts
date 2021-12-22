//
//  ViewController.swift
//  Astronauts
//
//  Created by M_Sanjay on 20/12/2021.
//

import UIKit

class AstronautsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sorted : Bool = true
    let astronatutsViewModel = AstronautsViewModel(apiServiceProtocol: APIHelper.shared)
    var astronauts = [Astronaut] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    func setUpView(){
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.title = Constants.Titles.astronauts
        self.navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(named: Constants.Assets.Images.sort), style: .plain, target: self, action: #selector(sortAstronauts)), animated: true)
        
        fetchData()
    }
    @objc func sortAstronauts() {
        let sortedList =  astronatutsViewModel.sort(astronauts: astronauts, ascending: sorted)
            sorted = !sorted
            astronauts = sortedList
        self.tableView.reloadData()
        if tableView.numberOfRows(inSection: 0) > 0 {
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: true)
        }
        
        }
    
    func fetchData(){
        
        astronatutsViewModel.getAstronautsList(url: URL(string: Constants.API.baseURL)!) { [weak self] result in
            switch result {
            case .success(let astronauts):
                self?.astronauts = astronauts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(title: Constants.Strings.error, message: error.localizedDescription)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Constants.segues.astronautDetailSegue){
            let astronautDeailsViewController = segue.destination as? AstronautDetailsViewController
            if let indexPath = sender as? IndexPath {
                astronautDeailsViewController?.astronautID = astronauts[indexPath.row].id
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
       
        let astronautCell = self.tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.astronautCell, for: indexPath) as! AstronautCell
                
        astronautCell.setUpView(with: astronaut)
                
        return astronautCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.segues.astronautDetailSegue, sender: indexPath)

    }
    
}
