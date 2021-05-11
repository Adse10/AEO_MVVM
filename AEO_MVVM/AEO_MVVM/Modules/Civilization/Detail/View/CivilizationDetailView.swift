//
//  CivilizationDetailView.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import UIKit

class CivilizationDetailView: UIViewController {
    
    // MARK: - Propiedades
    private let viewModel = CivilizationDetailViewModel()
    var idCiv: Int?

    // MARK: - Outlets
    @IBOutlet weak var lbTitleName: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTitleExpansion: UILabel!
    @IBOutlet weak var lbExpansion: UILabel!
    @IBOutlet weak var lbTitleArmy: UILabel!
    @IBOutlet weak var lbArmy: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Estilos
        loadStyles()
        // Obtenemos los datos
        loadData()
    }
    
    // MARK: Funciones privadas
    
    private func loadStyles(){
        lbTitleName.font = UIFont.boldSystemFont(ofSize: 18)
        lbTitleExpansion.font = UIFont.boldSystemFont(ofSize: 18)
        lbTitleArmy.font = UIFont.boldSystemFont(ofSize: 18)
        // Textos
        lbTitleName.text = "name".localize()
        lbTitleExpansion.text = "expansion".localize()
        lbTitleArmy.text = "army.type".localize()
    }
    
    private func loadData(){
        if let idCiv = self.idCiv {
            viewModel.getDetailCivilization(idCiv: idCiv)
            viewModel.refreshData = { () in
                self.showInfo()
            }
        }
    }
    
    private func showInfo(){
        guard let civilization = viewModel.dataDetail else { return }
        DispatchQueue.main.async {
            self.lbName.text = civilization.name
            if let expansion = civilization.expansion {
                self.lbExpansion.text = expansion
            }else{
                self.lbExpansion.isHidden = true
                self.lbTitleExpansion.isHidden = true
            }
            if let army = civilization.armyType {
                self.lbArmy.text = army
            }else{
                self.lbArmy.isHidden = true
                self.lbTitleArmy.isHidden = true
            }
        }
    }
}
