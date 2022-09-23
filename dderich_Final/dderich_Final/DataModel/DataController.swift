import Foundation
import UIKit
import CoreData

class DataController: ObservableObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getRecipes() -> Any {
        do {
            let fetchRequest = Recipe.fetchRequest() as NSFetchRequest<Recipe>
            
            let items = try context.fetch(fetchRequest)
            return items
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func createRecipe(ingredients: String, instructions: String, category: String, area: String, name: String, idMeal: String) {
        let recipe = Recipe(context: context)
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        recipe.category = category
        recipe.area = area
        recipe.name = name
        recipe.id = UUID()
        recipe.idMeal = idMeal
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func deleteRecipe(item: Recipe) {
        context.delete(item)
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
