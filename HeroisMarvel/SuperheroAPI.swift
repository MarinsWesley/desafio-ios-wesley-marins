import Foundation
import Alamofire

class SuperheroAPI {

    static private let basePath = "https://superheroapi.com/api"
    static private let accessToken = "8f5e794aa1ff73a475e1de24aaccdc4a"

    // MARK: - Search Heroes

    class func searchHeroes(
        name: String,
        onComplete: @escaping ([Hero]) -> Void
    ) {

        let encodedName = name.addingPercentEncoding(
            withAllowedCharacters: .urlPathAllowed
        ) ?? name

        let url = "\(basePath)/\(accessToken)/search/\(encodedName)"

        print(url)

        AF.request(url).responseDecodable(of: SuperheroSearchResponse.self) { response in

            switch response.result {

            case .success(let result):

                if result.response == "success" {
                    onComplete(result.results ?? [])
                } else {
                    print("API retornou erro: \(result.response)")
                    onComplete([])
                }

            case .failure(let error):

                print("Erro na requisição: \(error)")
                onComplete([])
            }
        }
    }

    // MARK: - Load Hero

    class func loadHero(
        id: String,
        onComplete: @escaping (HeroDetail?) -> Void
    ) {

        let url = "\(basePath)/\(accessToken)/\(id)"

        print(url)

        AF.request(url).responseDecodable(of: HeroDetail.self) { response in

            switch response.result {

            case .success(let hero):

                if hero.response == "success" {
                    onComplete(hero)
                } else {
                    print("API retornou erro: \(hero.response)")
                    onComplete(nil)
                }

            case .failure(let error):

                print("Erro na requisição: \(error)")
                onComplete(nil)
            }
        }
    }
}
