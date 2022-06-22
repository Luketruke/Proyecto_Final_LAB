<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Productos</h2>

    <div style="text-align: right;">
        <asp:LinkButton href="ProductosABM.aspx" ID="btnAgregar" class="btn btn-secondary btn-lg" Text="Agregar" runat="server"></asp:LinkButton>
    </div>

    <div>
        <asp:GridView ID="dgvProductos" runat="server" CssClass="table"></asp:GridView>
    </div>


</asp:Content>