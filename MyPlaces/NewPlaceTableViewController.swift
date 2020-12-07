//
//  NewPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Р71 on 07.12.2020.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Убираем разлиновку снизу от контента
        tableView.tableFooterView = UIView()
    }
// MARK: Table view Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // если тапнули на 1 ячейку( выбор картинки)
        if indexPath.row == 0
        {
            
        }
        // иначе скрываем клавиатуру
        else{
            view.endEditing(true)
        }
    }
   
}
// MARK Text Field Dilegete
extension NewPlaceTableViewController: UITextFieldDelegate{
    // скрываем клавиатуру по нажатию Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

