//
//  ViewController.swift
//  ContactsDemo
//
//  Created by Funnmedia 2 on 04/09/23.
//

import UIKit
import CoreData

class ContactViewController: UITableViewController {
    
    var indexforselect = 0

    
    @IBOutlet var table: UITableView?
    var contacts = [Contacts]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadContacts()
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        indexforselect = indexPath.row

        performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCells", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fname
        return cell
    }
    
    @IBAction func BarButtonClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        print(indexPath.row)
        indexforselect = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetails"{
            if let contactDetailVC = segue.destination as? ContactsDetailsViewController{
                contactDetailVC.contact = contacts[indexforselect]
            }
                
                
        }
    }
    
    func loadContacts(with request: NSFetchRequest<Contacts> = Contacts.fetchRequest()) {
        do {
            contacts = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        self.tableView.reloadData()
    }
    
    
    
}
