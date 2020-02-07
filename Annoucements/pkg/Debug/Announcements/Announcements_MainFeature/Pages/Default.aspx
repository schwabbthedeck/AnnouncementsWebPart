<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <%--<script type="text/javascript" src="../Scripts/jquery-3.4.1.min.js"></script>--%>
    <%--<SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />--%>
    <meta name="WebPartPageExpansion" content="full" />
		<style type="text/css">
			figure {
					display: inline-block;
					margin: 15px 30px;
			}
			figure img {
					border: 1px solid #444;
			}
			figure figcaption {
					text-align: center;
			}
		</style>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Announcements Web Part
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div style="max-width: 900px;">
        <h1>Announcements Web Part App</h1>
				<br />
				<h2>Overview</h2>
				<%--<p>Requires read access to the host site collection to gather list information that will be shown in the web parts.</p>--%>
				<p>The Announcements web part is designed to display announcements from an out-of-the-box announcements list in SharePoint.</p>
				<p>The web part relies on the out-of-the-box columns that are associated with the announcements list template. This is why the web part can only be used with a list that was created using the announcements list template.</p>				
				<figure>
						<img src="../Images/AnnouncementsWebPartScreenShot.png" alt="Announcements Web Part Example" width="450"/>
						<figcaption>Screen Shot of Announcements Web Part</figcaption>
				</figure>
				<br />
				<h2>Add Announcements Web Part</h2>
				<p>Once the Announcements app has been added to the site, navigate to a page in which the announcements are to be shown.</p>
				<p>Add the web part to the desired zone by selecting "Announcements Web Part".</p>
				<figure>
						<img src="../Images/AnnouncementsWebPartAddWebPart.png" alt="Add Announcements Web Part" width="400"/>
						<figcaption>Add Announcements Web Part</figcaption>
				</figure>
				<br />
				<h2>Configure Announcements Web Part</h2>
				<p>Once the web part is added, access the web part's property panel.</p>
				<p>There are two sections of properties that can be set: Announcements Custom Properties and Announcements Optional Properties. The properties to be set are outlined below. The "Announcements Custom Properties" control the main functions of the web part including what list to display, how many items to display, and if the date should be shown. The "Announcements Optional Properties" controls the date's background color and text color. The properties are described in more detail below.</p>
				<p>Announcements Custom Properties</p>
				<ul>
						<li><strong>Announcements List Title</strong>: Title of the list that is to be shown in the web part. If left blank, a message will appear prompting configuration is necessary.</li>
						<li><strong>Number of Announcements to Show</strong>: Number specifying how many announcements to show. Defaulted to 5. Most recently modified announcements will be shown first.</li>
						<li><strong>Show Date</strong>: Check box to notate if the date should be shown along with the announcement. Defaulted to checked (true). Date shown is the date the announcement was last modified.</li>
				</ul>
				<p>Announcements Optional Properties</p>
				<ul>
						<li><strong>Date Circle Background Color</strong>: Color that should be set on the date circle, formatted as it would be for "background" property in CSS.</li>
						<li><strong>Date Circle Text Color</strong>: Color that should be set on the text in the date circle, formatted as it would be for "color" property in CSS.</li>
				</ul>
				<p>Note:</p>
						<ul>
								<li>Announcements are sorted by last modified date. The most recently modified announcement items will be shown at the top.</li>
								<li>If the current date is after the "Expires" date of the announcement, it will not show.</li>
								<li>The list specified had to be created using the announcements list template. If another type of list template is used, the app will display an error specifying an announcements list must be used.</li>
								<li>When specifying the list title, ensure there are no leading or trailing spaces and the list title is spelled correctly.</li>
								<li>If any of the out-of-the-box columns are removed from the list, the web part will not work.</li>
								<li>If either color property is not set correctly, the web part may not appear correctly.</li>
						</ul>
				<figure>
						<img src="../Images/AnnouncementsWebPartProperties.png" alt="Announcements Web Part Properties" width="300" />
						<figcaption>Announcements Web Part Properties</figcaption>
				</figure>
				<figure>
						<img src="../Images/AnnouncementsWebPartSetProperties.png" alt="Announcements Web Part Set Properties" width="300" />
						<figcaption>Announcements Web Part Set Properties</figcaption>
				</figure>

    </div>

</asp:Content>
