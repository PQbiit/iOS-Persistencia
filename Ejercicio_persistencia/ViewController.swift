//
//  ViewController.swift
//  Ejercicio_persistencia
//
//  Created by Alumno on 10/12/17.
//  Copyright © 2017 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfID: UITextField!
    @IBOutlet weak var tfDescripcion: UITextField!
    @IBOutlet weak var tfExistencias: UITextField!
    
    var id: String!
    var descripcion: String!
    var existencias: Int!
    var segueIdentifier: Bool!
    var tableViewSelf: TableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segueIdentifier == false{
            tfID.text = id
            tfDescripcion.text = descripcion
            tfExistencias.text = String(existencias)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnGuardarIsPressed(_ sender: Any) {
        
        id = tfID.text
        descripcion = tfDescripcion.text
        existencias = Int(tfExistencias.text!)
        
        let newDic: NSDictionary = ["id":id,
                                    "descripcion":descripcion,
                                    "existencia":existencias]
        
        tableViewSelf.addNewElementToListaArticulos(newDictionary: newDic)
        navigationController!.popToRootViewController(animated: true)
        
    }
    
}

