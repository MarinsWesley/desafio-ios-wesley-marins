//
//  HeroesTableViewController.swift
//  HeroisMarvel
//
//  Created by MacBookAirWesley
//

import UIKit

class HeroesTableViewController: UITableViewController {

    var name: String?
    var heroes: [Hero] = []

    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    var loadingHeroes = false

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Loading heroes..."

        loadHeroes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard
            let indexPath = tableView.indexPathForSelectedRow,
            let viewController = segue.destination as? HeroViewController
        else {
            return
        }

        viewController.hero1 = heroes[indexPath.row]
    }

    // MARK: - Load Heroes

    func loadHeroes() {

        guard let name = name, !name.isEmpty else {
            label.text = "Digite o nome de um herói"
            tableView.reloadData()
            return
        }

        loadingHeroes = true

        SuperheroAPI.searchHeroes(name: name) { [weak self] heroes in

            guard let self = self else {
                return
            }

            DispatchQueue.main.async {

                self.loadingHeroes = false
                self.heroes = heroes

                if heroes.isEmpty {
                    self.label.text = "No heroes found!"
                } else {
                    self.label.text = nil
                }

                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        tableView.backgroundView = heroes.isEmpty ? label : nil

        return heroes.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as! HeroTableViewCell

        let hero = heroes[indexPath.row]

        cell.prepareCell(with: hero)

        return cell
    }
}
