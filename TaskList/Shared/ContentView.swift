//
//  ContentView.swift
//  Shared
//
//  Created by user218544 on 3/22/22.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var taskstore = taskStore()
    @State var newToDo : String = ""
    var editBar : some View{
        HStack{
            TextField("Enter in a new task: ", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {Text("Add New")})
        }
    }
    
    func addNewToDo(){
        if(newToDo.isEmpty==false){
        taskstore.tasks.append(TaskList.task(id:ObjectIdentifier(TaskList.task.self) ,name:newToDo))
            self.newToDo = ""
        }
    }
    
    
    var body: some View {
        NavigationView{
        VStack{
            editBar.padding()
            List{
                ForEach(self.taskstore.tasks) {
                    task in Text(task.name)
                }.onMove(perform: self.move).onDelete(perform:self.delete)
            }.navigationBarTitle("Tasks").navigationBarItems(trailing: EditButton())
        }}
    }
    
    func move(from source : IndexSet, to destination: Int){
        taskstore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete (at offsets: IndexSet){
        taskstore.tasks.remove(atOffsets: offsets)
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
