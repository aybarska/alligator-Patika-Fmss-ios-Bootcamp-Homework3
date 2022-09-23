

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    func deleteTask(todo t: ToDo, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        
        do {
            let context = persistentContainer.viewContext
            let result = try context.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                context.delete(todo)
                saveContext()
                completion(true)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func completeTask(todo t: ToDo, completion: @escaping (Bool) -> Void) {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            if result.count > 0 {
                let todo = result.first!
                todo.td_isEvaluated = true
                saveContext()
                completion(true)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func getAllTodos () -> [ToDo] {
        let request: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        let firstSort = NSSortDescriptor(key: #keyPath(ToDo.td_createdDate), ascending: false)
        request.sortDescriptors = [firstSort]
        var todos = [ToDo]()
        
        do {
            todos = try persistentContainer.viewContext.fetch(request)
        } catch let err {
            print(err.localizedDescription)
        }
        
        return todos
    }
    
    func saveToDo(td_title: String, td_description: String,td_createdDate: Date, completion: Bool) {
        let todo = ToDo(context: persistentContainer.viewContext)
        todo.td_title = td_title
        todo.td_createdDate = td_createdDate
        todo.td_description = td_description
        todo.td_isEvaluated = completion
        todo.id = UUID()
        saveContext()
        //completion(true)
    }
    
    
    func updateToDo(todoItem: ToDo, td_title: String, td_description: String, td_isEvaluated: Bool){
        let manageContext = persistentContainer.viewContext
        todoItem.td_title = td_title
        todoItem.td_description = td_description
        todoItem.td_isEvaluated = td_isEvaluated
        //todoItem.td_createdDate = Date()
        
        do {
            if manageContext.hasChanges{
                try manageContext.save()
                print("Basariyla  Guncellendi.")
            }
        } catch  {
            print("Guncelleme Basarisiz oldu")
            debugPrint("Guncelleme hatasi: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "alligator")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
