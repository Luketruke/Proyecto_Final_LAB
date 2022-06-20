<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ClientesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.ClientesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:Title %></h2>
    <h3>Clientela</h3>
    <p>Gestion de clientes</p>

    <asp:GridView runat="server" ID="dgvClientes"></asp:GridView>
    
</asp:Content>