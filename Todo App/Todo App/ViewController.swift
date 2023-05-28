//
//  ViewController.swift
//  Todo App
//
//  Created by Aamir khan on 29/03/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var enterTaskTextfield: UITextField!
    
    @IBOutlet weak var TableForTask: UITableView!
    //    @IBOutlet weak var TableForTask: UITableView!
    
    var TaskArray : [String] = []
    
    @IBAction func addTaskButton(_ sender: Any) {
        
        if let data = enterTaskTextfield.text{
            TaskArray.append(data)
        }
        else{
            return
        }
        TableForTask.reloadData()
        enterTaskTextfield.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableForTask.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = TaskArray[indexPath.row]
        return cell
    }
}
