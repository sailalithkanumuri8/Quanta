# Vista
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/Screenshot%202023-06-10%20at%2011.50.44%20AM.png)

An FBLA Mobile Application Development Project
By Sai Lalith Kanumuri, Bryan Nie, and Rithin Karthik

## Abstract
MyNCHS is an app for the North Creek High School Community. It holds many different features to help all users extract information on subjects related to our school. The app features many different features, like integrated social media, calendar scheduling, and more, which are either essential features or requirements for FBLA Mobile Application Development submissions. Along with the necessities for an information and productivity app, MyNCHS also provides in-built mailing, to communicate with North Creek personnel. The entirety of the app was built with Xcode, SwiftUI, UIkit, and more platforms, for iPhone and iPad, allowing for a streamlined, and stable app.

## Issue
We are from North Creek High School and are founders of MyNCHS, an app geared towards the North Creek community to stay informed and organized. We know how time-consuming it is for parents to find information about their school. That’s why we developed MyNCHS, the new way for parents to stay informed about North Creek High School fast and seamlessly.

## Installation
```
TO VIEW ON MACOS
1.Install Xcode Dev Tools on the Apple App Store for Mac
https://apps.apple.com/us/app/xcode/id497799835
2. Follow instructions to download this repo as a .ZIP file
https://sites.northwestern.edu/researchcomputing/resources/downloading-from-github/
3. Find the project.pbxproj file inside the files. It will be in the MyNCHS.xcodeproj folder when you extract and view the parent folder.
4.After that, log in with your developer account.
5. All thats left is to choose a simulator of choice and build!
```

```
TO VIEW ON iOS
1. If you want to view the MyNCHS app directly on your iPhone, plug your phone into your Mac. In the simulator options you can use your phone as an option.
2. When running, you may get a prompt on your phone to approve the app. Along with that, ensure your phone meets the requirements of the app.
```

## Pages
These are all of the big pages in the app, and information about them.
### Login
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/Screenshot%202023-06-10%20at%2012.21.38%20PM.png)
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/2login.png)
We aimed for a clean design throughout our app and wanted to reflect that on our login page, which is the first thing the user will see. We used a color scheme that matched our school and integrated Google Sign In SSO, which uses the Firebase platform.

Simply put, when the user attempts to log in to our app using Google Sign In SSO, their information will go to Firebase, a database made by Google. It verifies their info with an authentication view model which will allow them into our app. After the login, the compiler will go into ContentView, which states whether the login was successful.

### Home
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/Screenshot%202023-06-10%20at%2012.22.04%20PM.png)
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/2home.png)
The user is then taken to the homepage. At the bottom is the Menu Bar, which the user can use to navigate between the home, news, calendar, mailing, and info. The homepage has many suggestions for places to go. It uses Webview to show external content inside the app, making the homepage versatile and expandable.

Behind the scenes, when the user logs in with Firebase, the homepage runs and goes to the explore subpage, with classes and objects like WebView, which goes to the NSD site and suggestion-link, which shows the entire display onto the screen.

### News
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/Screenshot%202023-06-10%20at%2012.22.35%20PM.png)
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/2news.png)
One of the areas the user can go to from here is the news page. This page shows all of the recent news regarding North Creek. It is also organized in sections by topic. It has very user-friendly navigation, so you can find what you want easily.

With Firebase and Google SSO, the app can fetch the users information to display. The news subpages explore shows all of the newsletters, and it uses Webview, and a link news class to fetch articles from NSD’s site. Also social media links are fetched here using Webview and the Logos subpage.

### Calendar
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/Screenshot%202023-06-10%20at%2012.30.41%20PM.png)
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/2calendar.png)
The calendar allows users to keep track of school events and activities. It’s simple to use and is integrated conveniently. Notifications for the events exist to remind you about anything. Users will see default calendar events, but they can specifically add items for themselves if they want to, as well as edit or delete items. Many files are used to implement and keep the calendar working.

The calendar has many files working together to make it work. The events calendar view prints the whole calendar onto the screen with the calendar view. In the calendar view we also have a coordinator file to handle all changes to more subfiles like each event, list of events, and updates to them as well. Events the user makes will also send notifications to the user.

### Information
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/Screenshot%202023-06-10%20at%2012.33.17%20PM.png)
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/2info.png)
Lastly, we have our info page. This page gives the user information on external resources. It allows users to access essential sites quickly, as many things are integrated into the app. It’s also optimized for convenience by categorizing everything neatly. Users can sign out of their page and see their Google profile.

The Information page has simple code: using the link info tab, and WebView, we can link external sites such as the “enrollment” site. The logos subpage displays the social media on the phones screen using the link button class and Webview.

### Mailing
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/Screenshot%202023-06-10%20at%2012.32.55%20PM.png)
![Image](https://github.com/BoltOfLightning/MyNCHSFBLA/blob/main/README_assets/newassets/2mail.png)
We also have incorporated a mailing system for our app so that the user can ask their questions to the staff of NCHS right in the app for convenience. With this feature, users can send images, excuse absences, and ask questions all in the app.

The mailing system uses WebView 2 and a Webview model class to bring up an Apple mail page, where users can continue their action.

## Platforms
- SwiftUI
- UIkit
- Firebase(backend)

Our app is built with a bunch of different platforms. We namely used SwiftUI, UIkit, and Firebase.

SwiftUI is a programming language by Apple to easily make apps for apple devices. A big part of the app was made with this. However, SwiftUI lacks in some areas, so we also used UIkit. UIkit is another platform to make apps easily, and we used this to make our messaging feature. These two platforms are frontended, however.

The solution to that was using Firebase as well. We used Firebase for any backend processing not done solely on the device. We used Firebase to implement Google SSO technology, and to handle messages in our messaging feature.
## Privacy

At MyNCHS, we are committed to protecting the privacy of our users. This privacy policy outlines the types of data we collect, how we collect it, how we use it, and how we protect it.

#### Collection of Data
Without your express consent to have your data used, we will not collect any of your personal information. We may gather the following kinds of data if you decide to use our app and consent to its collection: Your name, email address, phone number, and any other details you give us are all considered to be personal information. Information concerning your usage of our app, such as the features you use, the sites you view, and the time and date of your activity, may be included in this category. Information regarding the device you are using to access our app, such as the model, operating system, and browser, may be included in this.

#### Opportunity for Data Collection
Please be aware that this chance could or might not arise in the future. We are dedicated to being open and honest with our users, and if we intend to gather any data, we'll let you know beforehand.

#### Sharing of Data
We value your privacy and will never divulge any of your personal information to any parties. Your information is private and will only be utilized to enhance our app. However, if our affiliates or service partners help us serve you with our app, we could share your data with them. Your data will be protected by these service providers according to their contractual obligations, and they are only allowed to use it for the stated purposes.

#### Use of Data
All information gathered will only be used to enhance the app. In order to provide you the best experience possible, we utilize your data to enhance the features and operation of our app. Additionally, we could contact with you through email about upcoming features or special offers that might be of interest to you.

#### Security of Data
We have put in place reasonable technological and organizational safeguards to guard your data against unauthorized access, disclosure, modification, and destruction because we take the security of your data seriously. To guarantee that your data is kept safe and secure, we also examine and update our security procedures on a regular basis.

#### Retention of Data
Your data will be kept on file for as long as is required to fulfill our legal requirements and give you access to our app. Additionally, we could keep your information for a reasonable amount of time after you stop using our app in order to enhance it and fight fraud or other nefarious acts.

#### Conclusion
Your privacy is important to us, and it is something we take seriously. Please contact us at sailalithkanumuri@gmail.com if you have any inquiries regarding our privacy statement or would like to exercise your rights with regard to your data.

## Future Plans
- Offer light and dark modes
- Android App Support
- Change the menu bar
- In-built messaging feature
- Add more features
	- Announcements
	- In-built note space
	- Home screen widget
- Additional support for Mac
- Text to speech

## Copyright
Any unoriginal images used in our project are protected under [Fair Use and Other Educational Uses.](https://www.lib.uchicago.edu/copyrightinfo/fairuse.html)

These images are credited in our 4 works cited pages.

[Images Works Cited](https://docs.google.com/document/d/1gb0S_kpVNI2wj3yfwLtIDacHqMnh-fjf/edit?usp=sharing&ouid=108122212341901317168&rtpof=true&sd=true)

[Libraries Works Cited](https://docs.google.com/document/d/1VhGBdrG-mcTlNvxbQyq2tXTVA--JAKM6/edit?usp=sharing&ouid=108122212341901317168&rtpof=true&sd=true)

[Resources Works Cited](https://docs.google.com/document/d/182PEfug-UBgXZYwSAnSAetnL3N1sTuj-/edit?usp=sharing&ouid=108122212341901317168&rtpof=true&sd=true)

[Works Cited Folder](https://drive.google.com/drive/folders/1p-5PA3dV4sLJx7Tha5dkODcOeL9XaEXU?usp=sharing)

The Google logo is used in compliance with [Googles trademark usage guidelines.](https://www.google.com/permissions/trademark/rules.html)

### Trademarks
Firebase platform is a registered trademark of Google LLC.
iOS is a registered trademark of Cisco in the U.S. and other countries.
iPadOS, Swift, SwiftUI, and Xcode are all registered trademarks of Apple Inc.

