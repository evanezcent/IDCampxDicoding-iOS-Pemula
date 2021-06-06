//
//  ViewController.swift
//  DicodingDynamicTable
//
//  Created by Pratama Yoga on 06/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title pada navigation
        self.navigationItem.title = "Indonesian Heroes"
        
        // Menghubungkan heroTableView dengan ke dua metode di bawah
        heroTableView.dataSource = self
        
        // Menambahkan delegate ke table view
        heroTableView.delegate = self
        
        // Menghubungkan berkas XIB untuk HeroTableViewCell dengn heroTableView.
        heroTableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as? HeroTableViewCell {
            
            // Menetapkan nilai hero ke view di dalam cell
            let hero = heroes[indexPath.row]
            cell.heroName.text = hero.name
            cell.heroDesc.text = hero.description
            cell.heroImage.image = hero.photo
            
            // Kode ini digunakan untuk membuat imageView memiliki frame bound/lingkaran
            cell.heroImage.layer.cornerRadius = cell.heroImage.frame.height / 2
            cell.heroImage.clipsToBounds = true
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName:"DetailViewController", bundle: nil)
        
        detail.hero = heroes[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
