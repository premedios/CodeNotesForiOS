//
//  LanguageListManagementViewController.swift
//  Code Notes
//
//  Created by Peter Witham on 2/6/17.
//  Copyright © 2017 Peter Witham. All rights reserved.
//

import UIKit

class LanguageListManagementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var languageTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        languageTable.delegate = self
        languageTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddLanguage(_ sender: UIButton) {
    }

    @IBAction func btnRemoveLanguage(_ sender: UIButton) {
    }
    
    @IBAction func btnResetLanguages(_ sender: UIButton) {
        (UIApplication.shared.delegate as! AppDelegate).languageListManagement.createLanguages()
    }
    
    @IBAction func btnClearAllLanguages(_ sender: UIButton) {
        (UIApplication.shared.delegate as! AppDelegate).languageListManagement.clearLanguages()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! LanguageListTableViewCell
        let language = (UIApplication.shared.delegate as! AppDelegate).languages[indexPath.row]
        cell.lblLanguageName.text = language.languageName
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}
