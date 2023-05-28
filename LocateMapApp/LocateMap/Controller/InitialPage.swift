//
//  InitialPage.swift
//  LocateMap
//
//  Created by Aamir khan on 06/04/23.
//

import UIKit

class InitialPage: UIViewController {

    @IBAction func moveToSecond(_ sender : Any){
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GettingLocationfromUser") as? GettingLocationfromUser else{return}
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
