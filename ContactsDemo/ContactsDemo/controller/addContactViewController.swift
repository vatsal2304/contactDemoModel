//
//  addContactViewController.swift
//  ContactsDemo
//
//  Created by Funnmedia 2 on 04/09/23.
//

import UIKit
import CoreData

class addContactViewController: UIViewController {

    var contacts = [Contacts]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Number: UITextField!
    @IBOutlet weak var MailId: UITextField!



    @IBAction func AddButtonPressed(_ sender: UIButton) {

        let newContact = Contacts(context: self.context)
        newContact.fname = FirstName.text!
        newContact.lname = LastName.text!
        newContact.cnumber = Number.text!
        newContact.cemail = MailId.text!
        
        self.contacts.append(newContact)
        self.saveCategories()

        _ = navigationController?.popToRootViewController(animated: true)
    }

    // MARK: functions
    func saveCategories() {
        do {
            try context.save()
            print("saved successfully")
        } catch {
            print("Error saving context \(error)")
        }

    }
}
