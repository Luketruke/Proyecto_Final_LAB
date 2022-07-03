<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ErrorLogin.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Login.ErrorLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Uups, Algo salio mal...</h1>
 
    
       <i style="font-size:60px; color:red" class="glyphicon glyphicon-user"></i> <i style="font-size:60px; color:red" class="glyphicon glyphicon-remove"></i> 
        <div>
        <asp:Label  style="font-size: 25px; color:tomato" ID="lblMensaje" runat="server" ></asp:Label>
        <p style="font-size:15px;"> Para loguearte haz click en el boton...</p>
        <asp:LinkButton ID="btnloguearme" runat="server" OnClick="btnloguearme_Click" CssClass="btn btn-danger"> 
        <i style="font-size: 15px;">Loguearme</i>
        </asp:LinkButton>
       </div>         
  


</asp:Content>
