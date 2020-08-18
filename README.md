# Web Application Desktop Framework

In the advent of Web 2.0 era I was on steroids to fully utilize the newer tools and technologies. Adobe Flex was the magical tool which helped me to materialize my vision. Many enterprise applications were still using vanilla javascripts and porlets for rendering the UI. 

I created an opensource framework using Action Script 3 and MXML which will enable full windows capabilities in the browser, something like having Visual Basic in the browser. However all the complexities are embedded in the framework so that developer can just extend the library and the features will be automatically added. I pretty much replicated how windows works internally, like every application will have an entry in task manager, the windows can be minimized or maximized, interdependencies between parent and child windows etc.

I initially uploaded the demo ( a much richer version that what’s given below ) and there were more than million views in just a week. In 2008 it still was a big thing as I never had any online presence. I started receiving emails from around the globe on sharing the code. 

Since adobe is sunsetting Flash by end of 2020, I have decided to provide my tribute by sharing some of the early concepts and code. 

It's my pleasure to say that this framework was reviewed and approved by [Yakov Fain](https://yakovfain.com/) (Java Champion) to be used across enterprise. There are applications still up and running using this framework in production system ( more than 12 years now) without any issues.

Here is a very early demo of the framework.

![image](images/waf.gif)

[Youtube Video of the same](https://youtu.be/wSkkoC40HIw)

## Features

Below is the page I used to open the actual demo.

![image](images/waf.png)

### Window Based Application
- Completely windows-based environment.
- All windows can have minimize, maximize, close, restore, resize, zoom out & zoom in buttons.

### Easy Application Integration
- The application integration very easy and generic.
- All the applications can be developed as a seperate Flex library project and the the framework will load the appropriate application configured in a xml file.
- Any Application can talk to another application, transfer objects and also can open child windows and communicate with them. 
- UI elements can also be draged and droped to a dedicated window defined by the developer. This way data can be transferred between two applications.

### Dynamic Start Menu
- The StartMenu is completely dynamic and generated based on user authorization model retrieved from server.
- The StartMenu dyanamically loads the application after user clicks on the menu item

### Plugin Flex Library
- Different applications can be developed as seperate project and just the library can be imported, no extra coding is required. 
- The framework can dynamically load individual applications. This will reduce the startup time.

### 4 Active Desktops
- This is one of the most complex feature. The framework allows users to work with 4 active desktops. 
- User can move their application from one desktop to another.

### Application and Task Manager
- This integrated tool shows all the applications opened in different desktops and allows users to move any application from one desktop to another. 
- This tool also shows the graphical plot of the memory uses by Flex runtime. 
- User can also kill or open any new applicaion from TaskManager.

### Additional Features
- Runtime Skinning
- Customized user Access
- Application Security
- Advanced Charting


### Running the Demo
You can still run the demo by opening the /demo/bin-debug/App2Demo.html file in internet explorer.  This was coded using Flex 3.










