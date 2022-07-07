<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuLogin.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Login.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <h1>Bienvenido!</h1>
         <i class="fas fa-user-check" style="color:limegreen"></i> <i style="color:limegreen" class="glyphicon glyphicon-thumbs-up"></i>   
        <p style="font-size: 15px;">Ingresaste Correctamente</p>
         <div>
    
        <asp:LinkButton ID="btnMenu" runat="server" CssClass="btn btn-success" OnClick="btnMenu_Click">
        <i style="font-size: 15px;">Acceder Inicio</i>
        </asp:LinkButton>
        </div>
                     
</asp:Content>
 