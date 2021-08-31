//
//  ViewController.swift
//  FilmMuzesi
//
//  Created by Burak İmdat on 31.08.2021.
//

import UIKit

class KategorilerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let veriSeti = VeriSeti()
    var secilenFilm = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return veriSeti.kategoriler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriCell") as? KategoriCell {
            cell.cellDuzenle(filmKategori: veriSeti.kategoriler[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenFilm = veriSeti.kategoriler[indexPath.row].kategoriAdi
        performSegue(withIdentifier: "toFilmListesi", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FilmListesiVC {
            vc.secilenKategoriAdi = secilenFilm
        }
    }
}

