# Announcements Web Part App
SharePoint App that creates a web part to render OOTB announcement lists.

### Overview
The Announcements web part is designed to display announcements from an out-of-the-box announcements list in SharePoint. 
The web part relies on the out-of-the-box columns that are associated with the announcements list template. This is why the web part can only be used with a list that was created using the announcements list template.

![alt text](https://github.com/schwabthedeck/AnnouncementsWebPart/blob/master/Annoucements/Images/AnnouncementsWebPartScreenShot.png "Announcements Web Part Example")

### Installation

### Add Announcements Web Part
Once the Announcements app has been added to the site, navigate to a page in which the announcements are to be shown.
Add the web part to the desired zone by selecting "Announcements Web Part".

![alt text](https://github.com/schwabthedeck/AnnouncementsWebPart/blob/master/Annoucements/Images/AnnouncementsWebPartAddWebPart.png "Add Announcements Web Part")

### Configure Announcements Web Part
Once the web part is added, access the web part's property panel.
There are two sections of properties that can be set: Announcements Custom Properties and Announcements Optional Properties. The properties to be set are outlined below. The "Announcements Custom Properties" control the main functions of the web part including what list to display, how many items to display, and if the date should be shown. The "Announcements Optional Properties" controls the date's background color and text color. The properties are described in more detail below.

##### Announcements Custom Properties
- **Announcements List Title**: Title of the list that is to be shown in the web part. If left blank, a message will appear prompting configuration is necessary.
- **Number of Announcements to Show**: Number specifying how many announcements to show. Defaulted to 5. Most recently modified announcements will be shown first.
- **Show Date**: Check box to notate if the date should be shown along with the announcement. Defaulted to checked (true). Date shown is the date the announcement was last modified.

##### Announcements Optional Properties
- **Date Circle Background Color**: Color that should be set on the date circle, formatted as it would be for "background" property in CSS. If left blank, color is set to black.
- **Date Circle Text Color**: Color that should be set on the text in the date circle, formatted as it would be for "color" property in CSS. If left blank, color is set to white.

#### Note:
- Announcements are sorted by last modified date. The most recently modified announcement items will be shown at the top.
- If the current date is after the "Expires" date of the announcement, it will not show.
- The list specified had to be created using the announcements list template. If another type of list template is used, the app will display an error specifying an announcements list must be used.
- When specifying the list title, ensure there are no leading or trailing spaces and the list title is spelled correctly.
- If any of the out-of-the-box columns are removed from the list, the web part will not work.
- If either color property is not set/left blank, the default background color is black and the default text color is white.
- If either color property is not set correctly, the web part may not appear correctly.

###### Announcements Web Part Properties
![alt text](https://github.com/schwabthedeck/AnnouncementsWebPart/blob/master/Annoucements/Images/AnnouncementsWebPartProperties.png "Announcements Web Part Properties")

###### Announcements Web Part Set Properties
![alt text](https://github.com/schwabthedeck/AnnouncementsWebPart/blob/master/Annoucements/Images/AnnouncementsWebPartSetProperties.png "Announcements Web Part Set Properties")
