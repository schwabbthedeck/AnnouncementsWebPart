'use strict';

ExecuteOrDelayUntilScriptLoaded(renderWebPart, "sp.js");

// decode the URL
var hostWebUrl = decodeURIComponent(getQueryStringParameter("SPHostUrl"));
var appWebUrl = decodeURIComponent(getQueryStringParameter("SPAppWebUrl"));
var listTitle = decodeURIComponent(getQueryStringParameter("AnnouncementsListTitle"));
var showDate = decodeURIComponent(getQueryStringParameter("ShowDate"));
var numberToShow = decodeURIComponent(getQueryStringParameter("NumberOfAnnouncementsToShow"));
var dateBackgroundColor = decodeURIComponent(getQueryStringParameter("DateCircleBackgroundColor"));
var dateTextColor = decodeURIComponent(getQueryStringParameter("DateCircleTextColor"));

function getQueryStringParameter(paramToRetrieve) {
  var params = document.URL.split("?")[1].split("&");
  for (var i = 0; i < params.length; i = i + 1) {
    var singleParam = params[i].split("=");
    if (singleParam[0] == paramToRetrieve) {
      return singleParam[1];
    }
  }
}

function renderWebPart() {
  $(document).ready(function () {
    getListInfo();
  });

  // get list information using the list title from the properties
  function getListInfo() {
    // check that list title isn't blank
    if (listTitle == "") {
      // if list title is blank in property settings, let user know web part needs to be configured
      appendContent('The "Announcements List Title" property is blank in the web part properties. Please configure the web part or contact an admin to have it configured.');
    } else {
      // list title wasn't empty so retrieve list info
      //var url = hostWebUrl + "/_api/web/lists/GetByTitle('" + listTitle + "')?select=Title,BaseTemplate";
      var url = appWebUrl + "/_api/SP.AppContextSite(@target)/web/lists/GetByTitle('" + listTitle + "')?@target='" + hostWebUrl + "'&?select=Title,BaseTemplate";
      var executor = new SP.RequestExecutor(appWebUrl);
      executor.executeAsync({
        url: url,
        method: "GET",
        headers: { "Accept": "application/json; odata=verbose" },
        success: successGetListInfo,
        error: errorHandler
      });
    }
  }

  function successGetListInfo(data) {
    var body = JSON.parse(data.body);
    var baseTemplateId = body.d.BaseTemplate;
    if (baseTemplateId == 104) {
      // list is of 'announcements' template
      // get list items from the list
      var today = new Date();
      var url = appWebUrl + "/_api/SP.AppContextSite(@target)/web/lists/GetByTitle('" + listTitle + "')/items?@target='" + hostWebUrl + "'&?select=Title,Body,Expires,Modified&$top=" + numberToShow + "&$orderby=Modified%20desc&$filter=Expires ge datetime'" + today.toISOString() + "' or Expires eq null";
      var executor = new SP.RequestExecutor(appWebUrl);
      executor.executeAsync({
        url: url,
        method: "GET",
        headers: { "Accept": "application/json; odata=verbose" },
        success: successGettingListItems,
        error: errorHandler
      });
    } else {
      // list isn't 'announcements' list
      appendContent('The list "' + listTitle + '" does not use the "Announcements" list template. Only Announcements lists can be used with this web part. Please reconfigure the web part or contact an admin to have it reconfigured.');
    }
  }

  function successGettingListItems(data) {
    var body = JSON.parse(data.body);
    var items = body.d.results;
    var html = "";
    for (var i = 0; i < items.length; i++) {
      var modDate = new Date(items[i].Modified);
      var dateStyleString = 'style="' + (dateBackgroundColor == '' ? '' : 'background:' + dateBackgroundColor + '; ') +
        (dateTextColor == '' ? '' : 'color:' + dateTextColor + ';') + '"'; 
      var dateHtml = '' +
        '<div class="date" ' + dateStyleString + '>' +
          '<span class="month">' + months[modDate.getMonth()] + '</span>' +
          '<span class="day">' + modDate.getDate() + '</span>' +
        '</div>';
      html += '' +
        '<div class="announcement-container">' +
          '<div class="title-container">' +
            (showDate == "true" ? dateHtml : '') +
            '<div class="title">' + items[i].Title + '</div>' +
          '</div>' +
          '<div class="body">' + items[i].Body + '</div>' +
        '</div>';
    }
    appendContent(html);
  }

  function errorHandler(data) {
    var body = JSON.parse(data.body);
    var errorMessage = body.error.message.value;
    var html = 'Error rendering web part: ' + errorMessage + '<br/>Please reconfigure the web part or contact an admin to have it reconfigured.';
    appendContent(html);
  }
}

function appendContent(content) {
  $('#announcements').append(content);
}

var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEPT", "OCT", "NOV", "DEC"];