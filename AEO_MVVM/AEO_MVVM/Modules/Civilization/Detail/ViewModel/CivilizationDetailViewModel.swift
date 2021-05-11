//
//  CivilizationDetailViewModel.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import Foundation

class CivilizationDetailViewModel {
    
    // MARK : - Propiedades
    private let connectionManager = CivilizationConnectionManager()
    
    var refreshData = { () -> () in }
    var dataDetail: Civilization? {
        didSet {
            refreshData()
        }
    }
    
    // Función para obtener el detalle de una civilización
    func getDetailCivilization(idCiv: Int){
        connectionManager.getDetailCivilization(idCiv: idCiv)
        connectionManager.refreshDataDetail = { () in
            self.dataDetail = self.connectionManager.dataDetailCiv
        }
    }
}
