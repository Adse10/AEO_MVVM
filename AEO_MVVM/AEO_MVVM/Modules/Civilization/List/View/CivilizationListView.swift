//
//  CivilizationListView.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import UIKit

final class CivilizationListView: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Propiedades
    private let viewModel = CivilizationListViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Estilos
        loadStyle()
        // Registramos las celdas
        registersCells()
        // Obtenemos los datos
        loadData()
    }
    
    // MARK: - PRivados
    
    private func loadStyle(){
        title = "civilizations".localize()
    }
    
    private func loadData(){
        viewModel.getListCivilization()
        viewModel.refreshData = { () in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func registersCells(){
        tableView.register(UINib(nibName: CivilizationCell.identifier, bundle: nil), forCellReuseIdentifier: CivilizationCell.identifier)
    }
}

extension CivilizationListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if viewModel.dataList.count > 0 {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CivilizationDetailView") as! CivilizationDetailView
            vc.idCiv = viewModel.dataList[indexPath.row].idCiv
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension CivilizationListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CivilizationCell.identifier, for: indexPath) as! CivilizationCell
        if viewModel.dataList.count > 0{
            cell.loadCivilization(viewModel.dataList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
}
