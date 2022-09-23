import UIKit
import Foundation
import SwiftyJSON
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    var idMeal :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    @IBAction func AddRecipe(_ sender: Any) {
        DataController().createRecipe(ingredients: ingredients.text!, instructions: instructions.text!, category: category.text!, area: area.text!, name: name.text!, idMeal: idMeal)
        getData()
    }
    
    @IBAction func ShowNewRecipe(_ sender: Any) {
        getData()
    }
    
    private func getData() {
        let url = "https://www.themealdb.com/api/json/v1/1/random.php"
        AF.request(url).responseJSON {
            response in
            if let resValue = response.value {
                let json = JSON(resValue)
            //debugPrint(json)
                do {
                    let p_name :String = json["meals"][0]["strMeal"].rawValue as? String ?? ""
                    self.name.text = p_name
                    
                    let p_category :String = json["meals"][0]["strCategory"].rawValue as? String ?? ""
                    self.category.text = p_category
                    
                    let p_area :String = json["meals"][0]["strArea"].rawValue as? String ?? ""
                    self.area.text = p_area
                    
                    let p_instr :String = json["meals"][0]["strInstructions"].rawValue as? String ?? ""
                    self.instructions.text = p_instr
                    
                    self.idMeal = json["meals"][0]["idMeal"].rawValue as? String ?? ""
                    
                    var p_ingr = ""
                    for i in 1...20 {
                        let p = "strIngredient" + String(i)
                        var ingVar :String = json["meals"][0][p].rawValue as? String ?? ""
                        if ingVar == "" || ingVar == nil {
                            break;
                        } else {
                            p_ingr += ingVar
                            
                            if (i + 1) > 20 {
                            } else {
                                let i_next = "strIngredient" + String(i + 1)
                                var nextIngr :String = json["meals"][0][i_next].rawValue as? String ?? ""
                                if (nextIngr == "" || nextIngr == nil) {
                                    
                                } else {
                                    p_ingr += ", "
                                    
                                }
                            }
                        }
                    }
                    self.ingredients.text = p_ingr
                    
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

/*struct Meal: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String
    let strTags: String
    let strYoutube: String
    
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    
    let strSource: String
    let strImageSource: String
    let strCreativeCommonsConfirmed: String
    let dateModified: Date
}
 {
   "meals": [
     {
       "idMeal": "52776",
       "strMeal": "Chocolate Gateau",
       "strDrinkAlternate": null,
       "strCategory": "Dessert",
       "strArea": "French",
       "strInstructions": "Preheat the oven to 180°C/350°F/Gas Mark 4. Grease and line the base of an 8 in round spring form cake tin with baking parchment\r\nBreak the chocolate into a heatproof bowl and place over a saucepan of gently simmering water and stir until it melts. (or melt in the microwave for 2-3 mins stirring occasionally)\r\nPlace the butter and sugar in a mixing bowl and cream together with a wooden spoon until light and fluffy. Gradually beat in the eggs, adding a little flour if the mixture begins to curdle. Fold in the remaining flour with the cooled, melted chocolate and milk. Mix until smooth.\r\nSpread the mixture into the cake tin and bake for 50-55 mins or until firm in the centre and a skewer comes out cleanly. Cool for 10 minutes, then turn out and cool completely.",
       "strMealThumb": "https://www.themealdb.com/images/media/meals/tqtywx1468317395.jpg",
       "strTags": "Cake,Chocolate,Desert,Pudding",
       "strYoutube": "https://www.youtube.com/watch?v=dsJtgmAhFF4",
       "strIngredient1": "Plain chocolate",
       "strIngredient2": "Butter",
       "strIngredient3": "Milk",
       "strIngredient4": "Eggs",
       "strIngredient5": "Granulated Sugar",
       "strIngredient6": "Flour",
       "strIngredient7": "",
       "strIngredient8": "",
       "strIngredient9": "",
       "strIngredient10": "",
       "strIngredient11": "",
       "strIngredient12": "",
       "strIngredient13": "",
       "strIngredient14": "",
       "strIngredient15": "",
       "strIngredient16": null,
       "strIngredient17": null,
       "strIngredient18": null,
       "strIngredient19": null,
       "strIngredient20": null,
       "strMeasure1": "250g",
       "strMeasure2": "175g",
       "strMeasure3": "2 tablespoons",
       "strMeasure4": "5",
       "strMeasure5": "175g",
       "strMeasure6": "125g",
       "strMeasure7": "",
       "strMeasure8": "",
       "strMeasure9": "",
       "strMeasure10": "",
       "strMeasure11": "",
       "strMeasure12": "",
       "strMeasure13": "",
       "strMeasure14": "",
       "strMeasure15": "",
       "strMeasure16": null,
       "strMeasure17": null,
       "strMeasure18": null,
       "strMeasure19": null,
       "strMeasure20": null,
       "strSource": "http://www.goodtoknow.co.uk/recipes/536028/chocolate-gateau",
       "strImageSource": null,
       "strCreativeCommonsConfirmed": null,
       "dateModified": null
     }
   ]
 }
 */
