//
//  NewPlaceTableViewController.swift
//  MyPlaces
//
//  Created by Р71 on 07.12.2020.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
    var imageIsChanged = false
    var newPlace: Place? // Объявление переменной с типом структуры
    @IBOutlet weak var placeType: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Убираем разлиновку снизу от контента
        tableView.tableFooterView = UIView()
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
// MARK: Table view Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // если тапнули на 1 ячейку( выбор картинки)
        if indexPath.row == 0
        {   // устанавливаем иконки для выбора варианта изображений
            let imageIcon = #imageLiteral(resourceName: "photo")
            let cameraIcon = #imageLiteral(resourceName: "camera")
                let actionSheet = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "TitleTextAlignment") // устанока текстового поля по левому краю
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            photo.setValue(imageIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "TitleTextAlignment")
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
    func saveNewPlace(){
        var image: UIImage?
        
        if imageIsChanged{
            image = placeImage?.image
        }
        else{
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        newPlace = Place(name: placeName.text!, type: placeType.text, restaurantName: nil,
                         location: placeLocation.text, image: image)
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
//MARK: Text Field Dilegete
extension NewPlaceTableViewController: UITextFieldDelegate{
    // скрываем клавиатуру по нажатию Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc private func textFieldChanged() {
        // проверяем заполнено ли текстовое поля для работы с save
        if placeName.text?.isEmpty == false{
            saveButton.isEnabled = true
        }
        else{
            saveButton.isEnabled = false
        }
        
    }
}
//MARK: Work with Image
extension NewPlaceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func chooseImagePicker(sourse: UIImagePickerController.SourceType)
    {
        if UIImagePickerController.isSourceTypeAvailable(sourse)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            // Позволяет пользователю редактировать изображения
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            imageIsChanged = true
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}
