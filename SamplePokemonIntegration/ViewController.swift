//
//  ViewController.swift
//  SamplePokemonIntegration
//
//  Created by Ujjwal on 25/02/2021.
//

import UIKit
import Pokemon

class ViewController: UIViewController, UISearchBarDelegate {

  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var searchBar: UISearchBar!

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  @IBAction func goAction(_ sender: Any) {
    let pokemon = PokemonUtils()
    pokemon.errorDelegate = self
    if let searchText = searchBar.text {
      pokemon.showPokemonPopup(presenter: self, searchText: searchText.lowercased())
    }
  }
  
}

extension ViewController: PokemonErrorDelegate {
  func didFailToFetchPokemon(error: (errorCode: Int, message: String)) {
  
    print("SDK error - \(error.message)")
    let alert = UIAlertController(title: "Error-\(error.errorCode)", message: error.message, preferredStyle: .alert)
    let actionOK = UIAlertAction(title: "Ok", style: .default)
    alert.addAction(actionOK)
    present(alert, animated: true, completion: nil)
  }
}
