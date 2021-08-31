//
//  FilmDetayVC.swift
//  FilmMuzesi
//
//  Created by Burak İmdat on 31.08.2021.
//

import UIKit

class FilmDetayVC: UIViewController {

    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var textViewFilmDetay: UITextView!
    @IBOutlet weak var lblFilmAdi: UILabel!
    
    var secilenFilm: Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let secilenFilm = secilenFilm {
            imgFilm.image = UIImage(named: secilenFilm.goruntuAdi)
            textViewFilmDetay.text = secilenFilm.detaylari
            lblFilmAdi.text = secilenFilm.adi
        }
    }

}
