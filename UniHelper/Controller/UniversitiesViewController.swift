//
//  UniversitiesViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 27.11.2022.
//

import FirebaseFirestore
import UIKit

protocol UniversityCellDelegator {
    func callSegueFromCell()
}

class UniversitiesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let searchController = UISearchController()

    var db = Firestore.firestore()

    var selectedUniversity = University(name: "", directions: [Direction(name: "")])

    var universities: [University] = [
        University(
            name: "Московский государственный университет имени М.В. Ломоносова",
            directions: [Direction(name: "")]),
        University(
            name: "Московский физико-технический институт", directions: [Direction(name: "")]),
        University(
            name: "Национальный исследовательский ядерный университет «МИФИ»",
            directions: [Direction(name: "")]),
        University(
            name: "Санкт-Петербургский государственный университет",
            directions: [Direction(name: "")]),
        University(
            name: "Московский государственный технический университет имени Н.Э. Баумана",
            directions: [Direction(name: "")]),
        University(name: "МГИМО МИД России", directions: [Direction(name: "")]),
        University(
            name: "Национальный исследовательский Томский политехнический университет",
            directions: [Direction(name: "")]),
        University(
            name: "Санкт-Петербургский политехнический университет Петра Великого",
            directions: [Direction(name: "")]),
        University(
            name:
                "Российская академия народного хозяйства и государственной службы при Президенте РФ",
            directions: [Direction(name: "")]),
        University(
            name: "Новосибирский национальный исследовательский государственный университет",
            directions: [Direction(name: "")]),
        University(
            name: "Уральский федеральный университет имени первого Президента России Б.Н. Ельцина",
            directions: [Direction(name: "")]),
        University(
            name: "Московский политехнический университет",
            directions: [
                Direction(name: "Веб-технологии"),
                Direction(name: "Большие и открытые данные"),
                Direction(name: "Автоматизированные системы обработки информации и управления"),
                Direction(name: "Программное обеспечение игровой компьютерной индустрии"),
                Direction(name: "Цифровая трансформация"),
                Direction(name: "Интеграция и программирование в САПР"),
                Direction(name: "Информационная безопасность автоматизированных систем"),
                Direction(name: "Киберфизические системы"),
                Direction(name: "Корпоративные информационные системы"),
                Direction(name: "Системная и программная инженерия"),
                Direction(name: "Технологии дополненной и виртуальной реальности"),
                Direction(name: "Программное обеспечение информационных систем"),
                Direction(name: "Информационные системы и технологии обработки цифрового контента"),
            ]),
    ]

    var filteredUniversities = [University]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        initSearchController()

        title = K.VC.universities
        navigationItem.hidesBackButton = true

        tableView.register(
            UINib(nibName: K.cellNibName, bundle: nil),
            forCellReuseIdentifier: K.universitiesCellIdentifier)
    }

    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == K.universitiesSegue else { return }
        guard let destination = segue.destination as? DirectionViewController else { return }
        destination.university = selectedUniversity
    }
}

// MARK: - UITableViewDataSource

extension UniversitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredUniversities.count
        }
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let university: University!
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: K.universitiesCellIdentifier, for: indexPath) as! UniversityCell

        if searchController.isActive {
            university = filteredUniversities[indexPath.row]
        } else {
            university = universities[indexPath.row]
        }

        cell.delegate = self
        cell.backgroundColor = UIColor.clear
        cell.universityName.text = university.name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UniversitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
            selectedUniversity = filteredUniversities[indexPath.row]
        } else {
            selectedUniversity = universities[indexPath.row]
        }
        
        performSegue(withIdentifier: K.universitiesSegue, sender: self)
    }
}

// MARK: - UniversityCellDelegator

extension UniversitiesViewController: UniversityCellDelegator {
    func callSegueFromCell() {
        self.performSegue(withIdentifier: K.universitiesSegue, sender: self)
    }
}

// MARK: - UISearchResultsUpdating, UISearchBarDelegate

extension UniversitiesViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text {
            filterForSearchText(searchText)
        }
    }

    func filterForSearchText(_ searchText: String) {
        filteredUniversities = universities.filter { university in
            if searchController.searchBar.text != "" {
                let searchTextMath = university.name.lowercased().contains(searchText.lowercased())
                return searchTextMath
            } else {
                return false
            }
        }
        tableView.reloadData()
    }
}
