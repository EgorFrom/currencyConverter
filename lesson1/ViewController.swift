//
//  ViewController.swift
//  lesson1
//
//  Created by mac-223 on 19/01/2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Add element", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "New name"
        }
        let alertAdd = UIAlertAction(title: "Add", style: UIAlertAction.Style.default) { (alertAction) in
            guard let addingText = alertController.textFields?[0].text,
                addingText != "" else { return }
            self.data.append(addingText)
            self.tableView.reloadData()
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        
        alertController.addAction(alertAdd)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    var data: [String] = ["Egor", "Dima", "Olya", "Marat"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAboutViewController" {
            guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
            let selectedCellIndexRow = indexPathForSelectedRow.row
            guard let destination = segue.destination as? AboutViewController else { return }
            destination.strData = data[selectedCellIndexRow]
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToAboutViewController", sender: self)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
