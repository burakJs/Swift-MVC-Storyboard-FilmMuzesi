//
//  FilmListesiVC.swift
//  FilmMuzesi
//
//  Created by Burak İmdat on 31.08.2021.
//

import UIKit

class FilmListesiVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var secilenKategoriAdi: String = ""
    var secilenFilm: Film = Film(adi: "YOK", detaylari: "YOK", goruntuAdi: "YOK")
    var veriSeti = VeriSeti()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return veriSeti.filmleriGetir(kategori: secilenKategoriAdi).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let filmCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as? FilmCell {
            filmCell.cellDuzenle(film: veriSeti.filmleriGetir(kategori: secilenKategoriAdi)[indexPath.row])
            return filmCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let genislik = view.bounds.width
        let hucreBoyutu = (genislik / 2) - 15
        return CGSize(width: hucreBoyutu, height: hucreBoyutu)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secilen = veriSeti.filmleriGetir(kategori: secilenKategoriAdi)[indexPath.row]
        secilenFilm.adi = secilen.adi
        secilenFilm.detaylari = secilen.detaylari
        secilenFilm.goruntuAdi = secilen.goruntuAdi
        performSegue(withIdentifier: "toFilmDetay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FilmDetayVC {
            vc.secilenFilm = secilenFilm
        }
    }
}
