﻿<%@ Page Title="Link to Die Set File" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Quality.ViewModels.PartSetUpViewModel>"  %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
Link to Die Set Up File
</asp:Content>

<asp:Content ID="headContent" ContentPlaceHolderID="HeadContent" runat="server">
   
</asp:Content>



<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
<br /><br /><br /><br /><br /><br /><br />
 
    <div class='pageheaders' style="width:60%;" >Link Die Set Up File to <%=Model.ItemID%> Part Set Up</div><br />


    <% using (Html.BeginForm("GetDieSetUpFile", "PartSetUp"))
		{ %>
   <%string pdfImagegfilepath = ConfigurationManager.AppSettings["PDFImageFilePath"];%>
   <%string filesavelocation = ConfigurationManager.AppSettings["DieSetUpInstructions"]; %>
   <% string diesetupfilepath = (Model.DieSetUpFilePath != null) ? Model.DieSetUpFilePath : "";%>
    <%= Html.HiddenFor(model => model.ItemID)%> 
    <%= Html.HiddenFor(model => model.PartSetUpID)%> 
            
   <br /><br />
  <div style="color:#003300;">Note: In order for a file to print with the travel card it must be located in the following file share: <span style="font-weight:bold;"><%=filesavelocation %></span>
 <br /> to insure that files can be opened by other users as 
    well as being detected by the travel card printing process.
      All Files must be in PDF format. </div>
       
      
  <div style="color:Red;"><%=Model.UserMessage %></div>
<table>
 
       <tr><td class="style1" bgcolor="#EDEEF7" >Die Set Up File :<label for="file">Select File (<img src="<%=pdfImagegfilepath %> "/> PDF only):</label>
    <input type="file" name="DieSetUpFilePath" id="DieSetUpFilePath" accept="file/pdf"/>(Must always reselect the document, unless you are removing it.)</td></tr>
    <tr><td><%if(diesetupfilepath.Length>0)
       {%>
       Delete link to current file <%=Html.CheckBoxFor(a => a.DieSetUpFileDelete)%> (Click link to View File). <a href="<%="file:///"+diesetupfilepath%>"target="_blank" ><%=diesetupfilepath%></a>
        
      <% }%>
       </td> </tr>
</table>
 <input type="submit"  class="button" value="Save" />
			
			<a href="javascript:history.go(-1)">
Cancel
</a>

<%} %>




	
</asp:Content>
