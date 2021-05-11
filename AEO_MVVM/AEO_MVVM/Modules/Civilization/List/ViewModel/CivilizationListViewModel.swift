//
//  CivilizationListViewModel.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import Foundation

class CivilizationListViewModel {
    
    // MARK: Propiedades
    let connectionManager = CivilizationConnectionManager()
    var refreshData = { () -> () in }
    var dataList: [Civilization] = [] {
        didSet {
            refreshData()
        }
    }
    
    // Función para obtener el listado de civilizaciones
    func getListCivilization(){
        connectionManager.getListCivilization()
        connectionManager.refreshDataList = { () in
            self.dataList = self.connectionManager.dataListCiv
        }
    }
}
