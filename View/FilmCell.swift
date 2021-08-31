//
//  FilmCell.swift
//  FilmMuzesi
//
//  Created by Burak İmdat on 31.08.2021.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    @IBOutlet weak var imgFilm: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgFilm.layer.cornerRadius = 10
    }
    
    func cellDuzenle(film: Film) {
        imgFilm.image = UIImage(named: film.goruntuAdi)
    }

}
