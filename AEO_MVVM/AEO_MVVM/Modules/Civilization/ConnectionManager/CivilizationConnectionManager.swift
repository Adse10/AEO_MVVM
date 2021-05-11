//
//  CivilizationConnectionManager.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import Foundation

class CivilizationConnectionManager {
    
    var refreshDataList = { () -> () in }
    var refreshDataDetail = { () -> () in }
    var dataListCiv: [Civilization] = [] {
        didSet {
            refreshDataList()
        }
    }
    var dataDetailCiv: Civilization? {
        didSet {
            refreshDataDetail()
        }
    }
    
    /* Función para obtener el listado de civilizaciones */
    func getListCivilization() {
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: Endpoints.main + Endpoints.civilizations)!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                do {
                    
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CivilizationList.self, from: data)
                    self.dataListCiv = result.civilizations
                    
                } catch let error {
                    
                    print("Ha ocurrido un error: \(error.localizedDescription)")
                }
            }
            else if response.statusCode == 401 {
                print("Error 401")
            }
        }.resume()
    }
    
    /* Función para obtener el detalle de una civilización */
    func getDetailCivilization(idCiv: Int) {
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string:  Endpoints.main + Endpoints.civilization + "/" + String(idCiv))!)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                do {
                    
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Civilization.self, from: data)
                    self.dataDetailCiv = result
                    
                } catch let error {
                    
                    print("Ha ocurrido un error: \(error.localizedDescription)")
                }
            }
            else if response.statusCode == 401 {
                print("Error 401")
            }
        }.resume()
    }
    
}
