//
//  Portfolio.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/25/23.
//

import SwiftUI
import GoogleSignIn

struct Portfolio: View {
    // Authenticates the user to enter the app
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    // Current instance of the user on the app
    private let user = GIDSignIn.sharedInstance.currentUser
    @State var showWebView = false
    
    // Each activity in portfolio
    struct Item {
        var title: String
        var description: String
    }
    
    // Each part of the portfolio
    struct Section {
        var title: String
        var image: String
        var description: String
        var items: [Item]
        var showingSheet: Bool
        var newTitle: String
        var newDescription: String
    }
    
    // Data for the current user
    @State private var sections: [Section] = [
        Section(title: "Projects", image: "newspaper.fill", description: "Extracurricular & Academic", items: [
            Item(title: "GreenAct", description: "Planted 50+ trees and helped 2 business owners with Sustainable energy consumption"),
            Item(title: "FBLA Mobile Application Development", description: "Built an app to keep track of students' portfolio"),
            Item(title: "FBLA Business Ethics", description: "Presented a business issue and proposed a solution")
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Honors", image: "medal.fill", description: "Academic or Non-Academic", items: [
            Item(title: "President's Service Award", description: "Recognized for 250+ hours of service in one year"),
            Item(title: "AP Scholar with Distinction", description: "Award from College Board for mastery in AP evams"),
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Athletics", image: "football.fill", description: "Sports & Activities", items: [
            Item(title: "Tennis", description: "Played tennis at school for 3 years"),
            Item(title: "Cricket", description: "Played cricket for more than 5 years"),
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Arts", image: "theatermask.and.paintbrush.fill", description: "Crafts & Performances", items: [
            Item(title: "Drawing and design", description: "Made lenticular painting drawing desert and ice."),
            Item(title: "Master doodler", description: "Been doodling for 17+ years"),
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Clubs", image: "person.3.fill", description: "Roles & Achievements", items: [
            Item(title: "FBLA", description: "Presents business topics"),
            Item(title: "NHS", description: "Aims to aspire youth to serve their communities"),
            Item(title: "Science Olympiad", description: "Developed technological solutions to everyday problems"),
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Volunteering", image: "carbon.dioxide.cloud.fill", description: "Community Service", items: [
            Item(title: "Learnable Organization", description: "Tutored 1,000+ students on AP Calculus, Python, and Astronomy"),
            Item(title: "Bothell Food Bank", description: "Helped serve food to 5,000+ people")
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Coursework", image: "book.fill", description: "Honors & Others", items: [
            Item(title: "AP Calculus AB", description: "AP Exam: 5/5"),
            Item(title: "AP Computer Science A", description: "AP Exam: 5/5"),
            Item(title: "AP Physics 1", description: "AP Exam: 4/5"),
            Item(title: "AP World History", description: "AP Exam: 5/5")
        ], showingSheet: false, newTitle: "", newDescription: ""),
        
        Section(title: "Others", image: "tray.full.fill", description: "Internships, Research, Jobs, etc", items: [
            Item(title: "Starbucks", description: "Learned job experience"),
        ], showingSheet: false, newTitle: "", newDescription: "")
    ]
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        // Collects user profile image from Google Sign In
                        NavigationLink(destination: Info(isCalendar: false)) {
                            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                                .padding(.top, 40)
                        }
                        .offset(x: 15)
                        
                        Button {
                            showWebView.toggle()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .sheet(isPresented: $showWebView) {
                            WebView(url: URL(string: "https://drive.google.com/file/d/1RgiUASM5yMyCKKIRzWX2wX0G2sQO_LrE/view?usp=sharing")!)
                        }
                        .offset(x: 20, y: 20)
                    }
                    Text("Your Portfolio")
                        .font(Font.custom("Quicksand-Bold", size: 40))
                        .padding(5)
                    
                    // Horizontal view with all the types of portfolio parts
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(sections.indices, id: \.self) { index in
                                LinkPortfolio(
                                    image: sections[index].image,
                                    text1: sections[index].title,
                                    text2: sections[index].description
                                )
                                .onTapGesture {
                                    selectedTabIndex = index
                                }
                            }
                        }
                        .padding(20)
                    }
                    .offset(y: -10)
                    
                    // Display content based on the selected section
                    if selectedTabIndex < sections.count {
                        SectionView(section: $sections[selectedTabIndex], addFunction: {
                            self.addNewItem(sectionIndex: selectedTabIndex)
                        })
                        .offset(y: -10)
                    }
                }
                .background(Color.gray.opacity(0.1).frame(width: 500, height: 700).offset(y: -250))
            }
        }
    }
    
    func addNewItem(sectionIndex: Int) {
        let section = sections[sectionIndex]
        
        // Add a new item to the respective section
        sections[sectionIndex].items.append(Item(title: section.newTitle, description: section.newDescription))
        
        // Reset new item fields
        sections[sectionIndex].showingSheet = false
        sections[sectionIndex].newTitle = ""
        sections[sectionIndex].newDescription = ""
    }
}

// This is each of the portfolio parts view
struct SectionView: View {
    @Binding var section: Portfolio.Section
    var addFunction: () -> Void
    
    var body: some View {
        VStack {
            // Content for each section
            VStack {
                HStack {
                    Text(section.title)
                        .font(Font.custom("Quicksand-Bold", size: 30))
                        .frame(width: 200, alignment: .leading)
                    
                    if #available(iOS 17.0, *) {
                        NavigationLink(destination: ChatBot()) {
                            Text("Gemini")
                                .font(Font.custom("Quicksand-Bold", size: 10))
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color("Color"))
                                .cornerRadius(15)
                                .frame(width: 70, height: 50, alignment: .center)
                        }
                        .padding(.trailing, 5)
                        .offset(x: 10)
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    Button {
                        section.showingSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color"))
                            .cornerRadius(20)
                    }
                }
                .padding(.top, 25)
            }
            
            // Outputs all of the activities from the user
            ForEach(section.items.indices, id: \.self) { index in
                TextItem(item: section.items[index])
            }
            .onDelete { indexSet in
                section.items.remove(atOffsets: indexSet)
            }
            .sheet(isPresented: $section.showingSheet) {
                // Pops up the view to add a activity if the "+" button is pressed
                AddItemView(section: $section, addFunction: addFunction)
            }
            .padding(.bottom, 10)
        }
        .frame(width: 390, height: .infinity)
        .background(.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}

// This is each individual activity content
struct TextItem: View {
    var item: Portfolio.Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(Font.custom("Quicksand-Regular", size: 20))
                .frame(width: 330, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text(item.description)
                .font(Font.custom("Quicksand-Medium", size: 15))
                .foregroundColor(.gray)
                .frame(width: 335, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
        .padding(.bottom, 5)
    }
}

// This is the button that allows the user to add an activity to the portfolio
struct AddItemView: View {
    @Binding var section: Portfolio.Section
    var addFunction: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                // These are the text fields to add an activity
                Section {
                    TextField("\(section.title) Title", text: $section.newTitle)
                    TextField("\(section.title) Description", text: $section.newDescription)
                }
                
                // The add button at the bottom which adds the activity to the portfolio
                Section {
                    Button("Add \(section.title)") {
                        addFunction()
                    }
                }
            }
            .navigationBarTitle("Add \(section.title)")
        }
    }
}

struct Portfolio_Previews: PreviewProvider {
    static var previews: some View {
        Portfolio()
    }
}
