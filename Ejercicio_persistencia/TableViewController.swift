//
//  TableViewController.swift
//  Ejercicio_persistencia
//
//  Created by Alumno on 10/12/17.
//  Copyright © 2017 Alumno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var listaArticulos: NSMutableArray! = []
    let dictionary: NSDictionary = ["id":"120",
                                    "descripcion": "Mesa",
                                    "existencia": 28]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaArticulos?.add(dictionary)

        
    }
    
    func addNewElementToListaArticulos(newDictionary: NSDictionary) -> Void{
        
        self.listaArticulos.add(newDictionary)
    
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return listaArticulos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (listaArticulos.object(at: indexPath.row) as! NSDictionary).value(forKey: "descripcion") as? String
        cell.detailTextLabel?.text = String(describing: (listaArticulos.object(at: indexPath.row) as! NSDictionary).value(forKey: "existencia") as! Int)
        
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var segueIdentifier = true
        
        if segue.identifier == "edit"{
            
            segueIdentifier = false
            
            let editView = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow
            let tableViewSelf: TableViewController = TableViewController(nibName: nil, bundle: nil)
            
            editView.id = (listaArticulos.object(at: (indexPath?.row)!) as! NSDictionary).value(forKey: "id") as? String
            editView.descripcion = (listaArticulos.object(at: (indexPath?.row)!) as! NSDictionary).value(forKey: "descripcion") as? String
            
            editView.existencias = (listaArticulos.object(at: indexPath!.row) as! NSDictionary).value(forKey: "existencia") as? Int
            
            editView.tableViewSelf = tableViewSelf
            editView.segueIdentifier = segueIdentifier
            
        }else{
            
            let addView = segue.destination as! ViewController
            let tableViewSelf: TableViewController = TableViewController()
            
            addView.id = "0"
            addView.descripcion = "null"
            addView.existencias = 0
            addView.tableViewSelf = tableViewSelf
            addView.segueIdentifier = segueIdentifier
            
        }
    }

}
