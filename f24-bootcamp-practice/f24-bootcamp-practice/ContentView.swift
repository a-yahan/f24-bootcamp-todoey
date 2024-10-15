//
//  ContentView.swift
//  f24-bootcamp-practice
//
//  Created by Yahan Yang on 10/15/24.
//
import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool
}

struct TodoList: Identifiable {
    var id = UUID()
    var title: String
    var todos: [TodoItem]
}

struct BindingPractice: View {
    @State var homework: TodoList = TodoList(title: "Homework", todos: [
        TodoItem(title: "Submit paper", isDone: false),
        TodoItem(title: "Finish 426 :(", isDone: false),
        TodoItem(title: "Read essays", isDone: false)
    ])
    
    @State var work: TodoList = TodoList(title: "Work", todos: [
        TodoItem(title: "Go to OH", isDone: false),
        TodoItem(title: "Close", isDone: false)
    ])
    
    @State var chores: TodoList = TodoList(title: "Chores", todos: [
        TodoItem(title: "Throw out trash", isDone: false),
        TodoItem(title: "Vacuum", isDone: false),
        TodoItem(title: "Do laundry", isDone: false)
    ])
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ListView(todos: $homework.todos)
                } label: {
                    Text(homework.title)
                        .font(.title3)
                }
                
                NavigationLink {
                    ListView(todos: $work.todos)
                } label: {
                    Text(work.title)
                        .font(.title3)
                }
                
                NavigationLink {
                    ListView(todos: $chores.todos)
                } label: {
                    Text(chores.title)
                        .font(.title3)
                }
            }
            .navigationTitle("Todo")
        }
    }
}


struct ListView: View {
    @Binding var todos: [TodoItem]
    var body: some View {
        List {
            ForEach($todos) { todo in
                ItemView(todo: todo)
            }
        }
    }
}

struct ItemView: View {
    @Binding var todo: TodoItem
    
    var body: some View {
        HStack {
            Button {
                todo.isDone.toggle()
            } label: {
                Image(systemName: todo.isDone ? "checkmark.square.fill" : "square")
            }
            
            Text(todo.title)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BindingPractice()
    }
}
