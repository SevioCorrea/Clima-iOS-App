//
//  ViewController.swift
//  Clima
//
//  Created by Sévio on 15/10/22.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {                       

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField! // Campo de texto de pesquisa
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self // Aqui está dizendo que o searchTextField deve retornar ele mesmo. Irá notificar o Controller.
    }
    

    @IBAction func searchPressed(_ sender: UIButton) { // Botão Lupa (search) da busca.
        searchTextField.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!) // Com ! porque nesse caso o text é um optional. Então é um campo vazio por padrão.
        return true // Para dizer ao textField que ele deve processar esse método (func).
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // "Should End Editing"
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Digite a Cidade"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
            
        // Use searchTextField.text para ir até ao clima da Cidade
        searchTextField.text = "" // "Did End Editing" Para limpar o campo de pesquisa quando pressionar "ir".
    }
    
}

