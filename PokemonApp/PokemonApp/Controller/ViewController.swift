//
//  ViewController.swift
//  PokemonApp
//
//  Created by Aamir khan on 19/04/23.
//

import UIKit

class ViewController: UIViewController {

    var arrayOfPokemon : [Results]?
    @IBOutlet weak var collectionViewForPokemons: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemon()
    }
    
    //MARK: Fetch data of pokemons from remote using URL of given JSON data.
    func fetchPokemon(){
        guard let URL = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50") else { return }
        
        let task = URLSession.shared.dataTask(with: URL){[weak self]
            (data, response,error) in
            guard let data = data, error == nil
            else { print("Not able to fetch data \(error)")
                return
            }
            var newPokemon : pokemonDataFromRemote?
            do{
               newPokemon = try JSONDecoder().decode(pokemonDataFromRemote.self,from: data)
            } catch {
                print("Error occured while decoding Json data into our structure \(error)")
            }
            self?.arrayOfPokemon = newPokemon?.results
            DispatchQueue.main.async {
                self?.collectionViewForPokemons.reloadData()
            }
        }
        task.resume()
    }
}

//MARK: configures collection view.
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    //MARK: Returns number of rows for the section.
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return arrayOfPokemon?.count ?? IntegerConstants.zero.rawValue
    }
    
    //MARK: Configure data in cell.
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let Cell = collectionViewForPokemons.dequeueReusableCell(withReuseIdentifier: StringConstants.cellForViewController.rawValue,for: indexPath) as? CollectionViewCellForPokemon else {return UICollectionViewCell()}
        return CollectionViewCellForPokemon.configureDataInCell(Cell: Cell,
                                                                arrayOfPokemon: arrayOfPokemon ?? [],
                                                                indexPath: indexPath)
    }
    
    //MARK: Navigates user from list of pokemons to details of selected pokemons.
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard let detailView = self.storyboard?.instantiateViewController(withIdentifier: StringConstants.storyBoardIdOfDetailsViewController.rawValue) as? detailViewController else {return}
        detailView.urlFromFirst = arrayOfPokemon?[indexPath.row].url
        self.navigationController?.pushViewController(detailView,
                                                      animated: true)
    }
}
