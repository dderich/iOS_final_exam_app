import Foundation
import UIKit
class TableViewController: UIViewController {
    
    @IBOutlet weak var Table: UITableView!
    
    var Recipes = [Recipe]()
    let sectionTitles: [String] = ["Your Favorite Recipes"]
    
    override func viewDidLoad() {
        self.Table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(Table)
        Table.delegate = self
        Table.dataSource = self
        Table.frame = view.bounds
        Recipes = DataController().getRecipes() as! [Recipe]
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = Recipes[indexPath.row]
        Table.deselectRow(at: indexPath, animated: true)
        let sheet = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            DataController().deleteRecipe(item: item)
            self.Recipes.removeAll()
            self.Recipes = DataController().getRecipes() as! [Recipe]
            self.Table.reloadData()
        }))
        present(sheet, animated: true)
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = Recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
      return sectionTitles[section]
    }
}
