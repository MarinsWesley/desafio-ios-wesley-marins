import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func prepareCell(with hero: Hero) {

        // Nome do herói
        lbName.text = hero.name

        // Informações do herói
        lbDescription.text = """
        Inteligência: \(hero.powerstats.intelligence)
        Força: \(hero.powerstats.strength)
        Velocidade: \(hero.powerstats.speed)
        """

        // Imagem do herói
        if let url = URL(string: hero.image.url) {

            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)

        } else {

            ivThumb.image = nil
        }

        // Configuração da imagem
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height / 2
        ivThumb.layer.borderColor = UIColor.red.cgColor
        ivThumb.layer.borderWidth = 2
        ivThumb.clipsToBounds = true
    }
}
