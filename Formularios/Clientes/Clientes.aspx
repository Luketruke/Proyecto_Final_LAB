<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.Clientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:Title %>Clientes </h2>

    <div style="text-align: right;">
        <asp:LinkButton href="ClientesABM.aspx" ID="btnAgregar" class="btn btn-secondary btn-lg" Text="Agregar" runat="server"></asp:LinkButton>
    </div>

    <asp:GridView runat="server" ID="dgvClientes" CssClass="table table-dark table-bordered"></asp:GridView>
 
</asp:Content>