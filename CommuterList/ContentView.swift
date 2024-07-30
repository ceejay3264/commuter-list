//
//  ContentView.swift
//  CommuterList
//
//  Created by Christopher Cordero on 7/23/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var showingAlert = false
    @State private var newItemName = ""
    @State var data: [ListItem] = []

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(data) { item in
                    ListItemView(item: item)
                }
                .onDelete { indexSet in
                    // TODO: Update for CoreData
                    data.remove(atOffsets: indexSet)
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("CommuterList")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showingAlert.toggle()
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .alert("Add an Item", isPresented: $showingAlert) {
                        TextField("Enter item name", text: $newItemName)
                        Button("Ok", action: {
                            addNewItem(withName: newItemName)
                            newItemName = ""
                        })
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Add an item to your list")
                    }
                }
            }

        }
        
    }
    
    // TODO: Update for CoreData
    private func addNewItem(withName name: String) {
        if !name.isEmpty {
            withAnimation {
                let newItem = ListItem(name: name, category: "")
                data.insert(newItem, at: 0)
            }
        }
    }

    // Temporary boilerplate code
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    // Temporary boilerplate code
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            //offsets.map { data[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// Temporary boilerplate code
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
