//
//  Opportunities.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 4/9/24.
//

import SwiftUI
import GoogleSignIn

struct Opportunity {
    var image: String
    var title: String
    var description: String
    var applyLink: String
}

struct Opportunities: View {
    // Current instance of the user on the app
    private let user = GIDSignIn.sharedInstance.currentUser
    let internships: [Opportunity] = [
        Opportunity(image: "Internship1", title: "Microsoft Software Engineering Internship", description: "Join Microsoft's internship program to work on cutting-edge projects in a collaborative environment.\n\nRequirements:\n• Strong programming skills in Java, C++, or Python\n• Familiarity with software development methodologies\n• Enrolled in a relevant degree program (Computer Science, Engineering, etc.)", applyLink: "https://example.com"),
        Opportunity(image: "Internship2", title: "WPP Marketing Internship", description: "Become part of a marketing team and assist with social media campaigns, market research, and marketing strategies. Develop visual content for various marketing materials, including advertisements, brochures, and social media posts.\n\nRequirements:\n• Strong communication and creative skills\n• Proficiency in graphic design tools (Adobe Photoshop, Illustrator, etc.)\n• Enrolled in a relevant degree program (Marketing, Communications, etc.)", applyLink: "https://example.com"),
        Opportunity(image: "Internship3", title: "Nvidia Data Science Internship", description: "Gain hands-on experience in data analysis, machine learning, and statistical modeling while contributing to data-driven decisions.\n\nRequirements:\n• Proficiency in statistical analysis tools (R, Python, etc.)\n• Familiarity with machine learning algorithms\n• Enrolled in a relevant degree program (Statistics, Data Science, etc.)", applyLink: "https://example.com"),
    ]
    
    let research: [Opportunity] = [
        Opportunity(image: "Research1", title: "Astrophysics Research Assistant at UW", description: "Work alongside professors and researchers on cutting-edge astrophysics projects, including data analysis and theoretical modeling.\n\nRequirements:\n• Strong mathematical and analytical skills\n• Familiarity with astrophysics concepts and theories\n• Enrolled in a relevant degree program (Physics, Astronomy, etc.)", applyLink: "https://example.com"),
        Opportunity(image: "Research2", title: "Computer Science Researcher at UNC Chapel Hill", description: "Participate in computer science research projects focusing on areas such as artificial intelligence, machine learning, and cybersecurity.\n\nRequirements:\n• Strong programming skills in languages like Python, Java, or C++\n• Knowledge of machine learning algorithms and techniques\n• Enrolled in a relevant degree program (Computer Science, Information Technology, etc.)", applyLink: "https://example.com"),
        Opportunity(image: "Research3", title: "AI Researcher at Georgia Tech", description: "Contribute to groundbreaking research in artificial intelligence, including algorithm development, computational modeling, and application development.\n\nRequirements:\n• Strong background in mathematics and algorithms\n• Proficiency in programming languages such as Python, Java, or C++\n• Enrolled in a relevant degree program (Computer Science, Engineering, etc.)", applyLink: "https://example.com")
    ]
    
    let clubs: [Opportunity] = [
        Opportunity(image: "Clubs3", title: "Honors Society", description: "Join the Honors Society to recognize academic excellence, participate in service projects, and engage in leadership development activities.\n\nRequirements:\n• High academic achievement\n• Commitment to community service\n• Strong leadership qualities", applyLink: "https://example.com"),
        Opportunity(image: "Clubs1", title: "Rubik's Cube Club", description: "Join the Rubik's Cube Club and learn solving techniques, participate in competitions, and engage with fellow enthusiasts.\n\nRequirements:\n• Interest in Rubik's Cube solving\n• Open to all skill levels\n• Enthusiasm for puzzles and problem-solving", applyLink: "https://example.com"),
        Opportunity(image: "Clubs2", title: "Math Club", description: "Become a member of the Math Club to explore various mathematical topics, solve challenging problems, and participate in math-related events.\n\nRequirements:\n• Passion for mathematics\n• Willingness to engage in group discussions and activities\n• Open to all skill levels", applyLink: "https://example.com")
    ]
    
    let jobs: [Opportunity] = [
        Opportunity(image: "Jobs1", title: "Software Engineer at Google", description: "Join Google's software engineering team to work on innovative projects that impact millions of users worldwide.\n\nRequirements:\n• Proficiency in programming languages such as Java, Python, or C++\n• Strong problem-solving and algorithmic skills\n• Bachelor's degree in Computer Science or related field", applyLink: "https://example.com"),
        Opportunity(image: "Jobs2", title: "Cashier at Chipotle", description: "Provide excellent customer service while handling cash transactions, taking orders, and maintaining a clean and organized workspace.\n\nRequirements:\n• Strong interpersonal skills and ability to work in a fast-paced environment\n• Availability to work flexible hours, including evenings and weekends\n• High school diploma or equivalent", applyLink: "https://example.com"),
        Opportunity(image: "Jobs3", title: "Sales Manager at Burger King", description: "Lead a team of sales associates to achieve sales targets, provide exceptional customer service, and ensure smooth operations.\n\nRequirements:\n• Previous experience in sales or customer service\n• Strong leadership and communication skills\n• Bachelor's degree in Business Administration or related field preferred", applyLink: "https://example.com"),
        Opportunity(image: "Jobs4", title: "Market Analyst at Goldman Sachs", description: "Analyze market trends, evaluate investment opportunities, and provide insights to support strategic decision-making.\n\nRequirements:\n• Strong analytical and quantitative skills\n• Familiarity with financial markets and investment strategies\n• Bachelor's degree in Finance, Economics, or related field", applyLink: "https://example.com"),
        Opportunity(image: "Jobs5", title: "Software Engineer at Amazon", description: "Work on challenging projects in a fast-paced environment, collaborating with cross-functional teams to deliver high-quality software solutions.\n\nRequirements:\n• Experience in software development and debugging\n• Proficiency in programming languages such as Java, Python, or C++\n• Bachelor's degree in Computer Science or related field", applyLink: "https://example.com")
    ]
    
    let volunteering: [Opportunity] = [
        Opportunity(image: "Volunteering1", title: "Volunteer at UTSAV", description: "Support community initiatives and events by volunteering with UTSAV, a non-profit organization dedicated to cultural and social development.\n\nRequirements:\n• Strong interpersonal skills and compassion\n• Ability to follow hospital protocols and guidelines\n• Commitment to making a positive impact on others", applyLink: "https://example.com"),
        Opportunity(image: "Volunteering2", title: "Volunteer at Seattle Children's Hospital", description: "Make a difference in the lives of children and families by volunteering at Seattle Children's Hospital, assisting with various activities and programs.\n\nRequirements:\n• Strong interpersonal skills and compassion\n• Ability to follow hospital protocols and guidelines\n• Commitment to making a positive impact on others", applyLink: "https://example.com")
    ]
    
    var body: some View {
        NavigationView {
            // Page content
            ScrollView {
                VStack {
                    HStack {
                        Text("Opportunities")
                            .font(Font.custom("Quicksand-Bold", size: 30))
                            .padding(15)
                            .offset(x: 5, y: 10)
                        
                        Spacer()
                        
                        // Dipslays user's profile image
                        NavigationLink(destination: Info(isCalendar: false)) {
                            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: .center)
                                .cornerRadius(30)
                                .offset(x: -20, y: 10)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    // Display internships
                    OpportunitySectionView(title: "Internships", opportunities: internships)
                    
                    // Display research opportunities
                    OpportunitySectionView(title: "Research", opportunities: research)
                    
                    // Display clubs
                    OpportunitySectionView(title: "Clubs", opportunities: clubs)
                    
                    // Display jobs
                    OpportunitySectionView(title: "Jobs", opportunities: jobs)
                    
                    // Display volunteering opportunities
                    OpportunitySectionView(title: "Volunteering", opportunities: volunteering)
                }
                .background(Color.gray.opacity(0.1).frame(width: 500, height: 2000))
            }
        }
    }
}

struct LinkOpportunities: View {
    var opportunity: Opportunity
    
    var body: some View {
        NavigationLink(destination: OpportunityDetailView(opportunity: opportunity).navigationBarColor(.white)) {
            VStack {
                HStack {
                    Image(opportunity.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    VStack {
                        Text(opportunity.title)
                            .font(Font.custom("Quicksand-Bold", size: 15))
                            .foregroundColor(.black)
                            .frame(width: 150, height: 60, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 5)
                            .padding(.top, 27)
                        
                        Text("Apply")
                            .font(Font.custom("Quicksand-Bold", size: 12))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 25)
                            .background(Color("Color"))
                            .cornerRadius(40)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(x: 6)
                    }
                }
                .frame(width: 255, height: 110)
                .padding()
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("SecondaryColor").opacity(0.3), lineWidth: 5)
                )
                .cornerRadius(15)
            }
        }
    }
}

struct OpportunityDetailView: View {
    let opportunity: Opportunity
    @State var showWebView = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image(opportunity.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .frame(width: 390, alignment: .leading)
                        .padding(.top, 110)
                    
                    Text(opportunity.title)
                        .font(Font.custom("Quicksand-Bold", size: 20))
                        .multilineTextAlignment(.leading)
                        .frame(width: 250, height: 50, alignment: .leading)
                        .offset(x: -50)
                        .padding(.bottom, 20)
                }
                .frame(width: 390, height: .infinity)
                .background(.white)
                .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                .padding(.bottom, 10)
                
                Text(opportunity.description)
                    .font(Font.custom("Quicksand-Regular", size: 15))
                    .frame(width: 350, alignment: .leading)
                    .padding(.bottom, 10)
                
                
                // Apply Now button
                Button {
                    showWebView.toggle()
                } label: {
                    Text("Apply Now")
                        .font(Font.custom("Quicksand-Bold", size: 16))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color("Color"))
                        .cornerRadius(15)
                        .frame(width: 350, alignment: .leading)
                }
                .sheet(isPresented: $showWebView) {
                    WebView(url: URL(string: opportunity.applyLink)!)
                }
                .padding()
                
                Spacer()
            }
            .background(Color.gray.opacity(0.1).frame(width: 500, height: 2000))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OpportunitySectionView: View {
    let title: String
    let opportunities: [Opportunity]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.custom("Quicksand-Medium", size: 15))
                .frame(width: 300, alignment: .leading)
                .padding(.bottom, 10)
                .offset(x: 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(opportunities, id: \.title) { opportunity in
                        LinkOpportunities(opportunity: opportunity)
                    }
                    .padding(.bottom, 8)
                }
                .padding(.horizontal)
            }
        }
    }
}

// Extension to set navigation bar color
extension View {
    func navigationBarColor(_ backgroundColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .background(Color(UIColor.systemBackground))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct Opportunities_Previews: PreviewProvider {
    static var previews: some View {
        Opportunities()
    }
}
