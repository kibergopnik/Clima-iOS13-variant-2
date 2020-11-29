//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    //Деактивирует клавиатуру при нажатии на значёк поиска
    //Выполняет какое либо действие при нажатии кнопки  например как сейчас печатает введённый текст
    @IBAction func searshPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
      
       
    }
  
    
    //Просто начать печатать название метода и он вызовется
//    Если метод уже есть он больше не вызывается

    //Деактивирует клавиатуру при нажатии на клавишу go на клавиатуре  и выполняет какое то действие (печатает текст введенный пользователет)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true) //Деактивирует клавиатуру
        return true
    }
//Если пользователь не ввёл данных и нажад на поиск. пишет "Type shomething" в текстовом поле и оставляет клавиатуру  . а если ввел передает дальше
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
        return true
        }else{
         textField.placeholder = "Type shomething"
          
          return false
        }
    }
//Убирает напечатанный  текст из textField после редактирования(нажатие кнопки)
    func textFieldDidEndEditing(_ textField: UITextField) {
       searchTextField.text! = ""
        
    }
   
}


