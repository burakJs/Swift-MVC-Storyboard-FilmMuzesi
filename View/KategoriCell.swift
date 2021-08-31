//
//  KategoriCell.swift
//  FilmMuzesi
//
//  Created by Burak İmdat on 31.08.2021.
//

import UIKit

class KategoriCell: UITableViewCell {

    @IBOutlet weak var imgKategori: UIImageView!
    @IBOutlet weak var lblKategori: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgKategori.layer.cornerRadius = 10
    }
    
    func cellDuzenle(filmKategori: FilmKategori){
        imgKategori.image = UIImage(named: filmKategori.goruntuAdi)
        lblKategori.text = filmKategori.kategoriAdi
    }
}
