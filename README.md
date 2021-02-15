# lib_LC_LMS_LTI Example Levure based LiveCode application

Martin Koob (info@videolinkwell.com)

### **Introduction**

This is the Levure based application that I created with two aims. 
1. To learn how to use the [Levure Framework](https://livecode.com/products/livecode-platform/levure/) for creating LiveCode applications.
2. To create a library that would allow a LiveCode application to integrate with an LMS using LTI 1.3 [Learning Tools Interoperability](https://www.imsglobal.org/activity/learning-tools-interoperability).

The reason I wanted to share this with the xAPI Spring 2021 team-xapi-in-livecode is as a demonstration how a LiveCode project built with the Levure framework would incorporate a library.   The benefits of using the Levure framework aside from having many of an application's functions prebuilt is that it uses a relatively new feature of LiveCode [Script only stacks](https://livecode.com/script-only-stacks/).  A script only stack is just a text file (previously stacks were binary files).  This allows a team to work collaboratively on a project using a version management system like github i.e. Several people can be working on parts of the code of the project (called scripts in LiveCode) and the changes they make can be tracked and coordinated in github.   

When you look at the file structure of the Application it can be quite daunting especially for someone new to coding or to LiveCode. The good thing is that you don't have to worry about most of those files.  There are really only 4 or 5 of the files that you need to edit for a simple project like this.

### **Exploring the Project**

**Creating a local repository**
Before you can work on the project you have to download the project to your desktop in a way that will ensure it remains connected to the project in github.  To do that you have to create a local repository folder on your desktop computer and have github download the project there. 

_**...I am not that versed in github so I will leave someone else with more github chops to fill in this step....**_

**Downloading LiveCode**
Once you have the project in your local repository you can open it with the LiveCode application.  You can download a free open source of LiveCode here [LiveCode.org](https://livecode.org/).

**Opening the project**
To open a Levure project you need to select the **File** menu and then select the **Open Stack...** menu.  This opens a file broswer dialog.  In there navigate to the folder **lib_LC_LMS_LTI** in your new repository folder and then select the LiveCode stack app/standalone.livecode and click the **Open** button. 

This brings up a window (which is a stack) with an **Open Application** button -- click that.

Next you see another window (another stack) that asks for a user name and password.  This is just a placeholder login dialog.  Type anything into the username and password fields and click **Login**.

Dismiss the next dialog by clicking **OK**

### Hello world!
Now you get the payoff! A stack opens that shows a card called **Settings**.  There are fields for credentials that you can fill in if you are trying to connect to an LMS that is LTI compliant.  For now you don't have to do that to get a simple demo of what the project can do at the moment.

So now if you want to get the big 'Hello world' moment 
* click on the **Create Requests** button. This switches the card showing in the **Main Window** stack to the **Create Requests** card 
* click on the **get product versions** button. The response will be in the 'Result' field is the JSON response containing all the product Codes that the host supports and their versions including the latest version.
For even more fun:
* Click on the **Find project Version** button to find the latest version of the ProductCodes listed in the results window. try typing bas, lp, lti into the dialog and see the result.  To find other product codes scroll through the **Response** field.

The rest of this project to create a LiveCode library for integration LiveCode application using LTI is a work in progress. This is not the goal of team-xapi-in-livecode.  This could however be a template for the project that this group decides to create.

If you are new to LiveCode you will need to learn how to use the IDE to dive into the scripts.  LiveCode offers a number of [Lessons](https://lessons.livecode.com/#GettingStartedWithLivecode) to get you up and running.  If you run into difficulty or have specific questions post them in the \#discuss-dev-livecode. I am sure one of the LiveCoders in the team will answer

### Issues
With any project there are bugs that you need to fix or features that you want to add.  You can track these in github using the Issues feature.  If you click on  **Issues**  on the github page.  I have posted 1 issue so far.  It is a bug that relates to ensuring the project works properly in Levure. The problem is the settings card behaviour does not load properly so the script handlers are not called.  I am not sure why, the requests card behaviour works fine. Click on  issue \#1  to read more about the problem.  See the 'Create Requests' button and the stack 'settings card behavior' scripts for more details in the comments.

There are other issues and features I have been planning to add to get the LTI 1.3 integration feature working.  If you opened the scripts search the scripts for the word 'TODO' you will find the next steps I was planning to work on.  If you are so inclined you can create an issue and then start working on adding the new features.  However that is not the focus of the xAPI Spring 2021 \#team-xapi-in-livecode group but I just wanted to give a demonstration and an overview of how the team could work on a project using Levure and github.
