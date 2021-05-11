//
//  CivilizationCell.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import UIKit

class CivilizationCell: UITableViewCell {
    
    static let identifier = "CivilizationCell"
    
    // Propiedades
    @IBOutlet weak var lbName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Creamos estilos
        loadStyles()
        // Initialization code
    }
    
    // MARK: - Funciones privadas
    
    private func loadStyles(){
        lbName.font = UIFont(name: "Girassol-Regular", size: UIFont.labelFontSize)
    }
    
    // MARK: - Funciones públicas

    func loadCivilization(_ civilization: Civilization){
        if let name = civilization.name {
            lbName.text = name
        }
    }
}
