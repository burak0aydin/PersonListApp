//
//  ViewController.swift
//  PersonListApp
//
//  Created by Burak Aydın on 18.09.2023.
//

import UIKit

class MainPage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personsTableView: UITableView!
    
    var personsList = [Persons] ()
    var viewModel = MainPageViewModel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self
        
        _ = viewModel.personsList.subscribe(onNext: { personsList in
            self.personsList = personsList
            self.personsTableView.reloadData()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadsPersons()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let person = sender as? Persons {
                let toVC = segue.destination as! PersonDetails
                toVC.person = person
            }
        }
    }
    
   
    

}

extension MainPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

extension MainPage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonCell
        
        cell.nameTextLabel.text = person.person_name
        cell.phoneNoTextLabel.text = person.person_phone
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personsList[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let person = self.personsList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete the \(person.person_name!) ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let okeyAction = UIAlertAction(title: "Okey", style: .destructive) { action in
                self.viewModel.delete(person_id: person.person_id!)
                
            }
            alert.addAction(cancelAction)
            alert.addAction(okeyAction)
            self.present(alert,animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}

