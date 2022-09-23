//  Created by Setup on 2022-08-16.
import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var ingredients: String?
    @NSManaged public var area: String?
    @NSManaged public var category: String?
    @NSManaged public var instructions: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var idMeal: String?
}

extension Recipe : Identifiable {

}
