//
//  ContactsDetailsViewController.swift
//  ContactsDemo
//
//  Created by Funnmedia 2 on 06/09/23.
//

import UIKit
import CoreData

class ContactsDetailsViewController: UIViewController {

    
    var contact: Contacts?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var PhoneNumber: UILabel!
    @IBOutlet weak var EmailId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstName.text = contact?.fname
        lastName.text = contact?.lname
        EmailId.text = contact?.cemail
        PhoneNumber.text = contact?.cnumber
    }
    
//    func loadContacts(with request: NSFetchRequest<Contacts> = Contacts.fetchRequest()) {
//        do {
//            contact = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//    }


    
}
