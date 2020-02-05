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
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Announcements Web Part
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div>
        <h1>Welcome to Announcements web part</h1>
				<br />
				<h2>Overview</h2>
				<%--<p>Requires read access to the host site collection to gather list information that will be shown in the web parts.</p>--%>
				<p>The Announcements web part is designed to display annoucements from the out-of-the-box annoucements list.</p>
				<p><img src="../Images/AnnouncementsWebPartScreenShot.png" alt="Announcements Web Part Example" width="450" /></p>
				<p>The web part relies on the out-of-the-box columns that are associated with the annoucements list template. This is why the web part can only be used with a list that was created using the announcements list template.</p>
				<h2>Adding and Configuring the web part:</h2>
				<p>TODO: add information here</p>
    </div>

</asp:Content>
