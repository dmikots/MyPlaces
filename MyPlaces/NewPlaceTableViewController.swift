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
                let actionSheet = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            // вызов контроллера
            present(actionSheet, animated: true)
        }
        // иначе скрываем клавиатуру
        else{
            view.endEditing(true)
        }
    }
   
}
//MARK: Text Field Dilegete
extension NewPlaceTableViewController: UITextFieldDelegate{
    // скрываем клавиатуру по нажатию Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
//MARK: Work with Image
extension NewPlaceTableViewController{
    func chooseImagePicker(sourse: UIImagePickerController.SourceType)
    {
        if UIImagePickerController.isSourceTypeAvailable(sourse)
        {
            let imagePicker = UIImagePickerController()
            // Позволяет пользователю редактировать изображения
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true, completion: nil)
        }
    }
}
