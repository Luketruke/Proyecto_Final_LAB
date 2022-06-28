<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Productos</h2>

    <div style="text-align: right;">
        <asp:LinkButton href="ProductosABM.aspx" ID="btnAgregar" class="btn btn-secondary btn-lg" Text="Agregar" runat="server"></asp:LinkButton>
    </div>

    <div>
        <asp:GridView ID="dgvProductos" runat="server" CssClass="table" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id" />
                <asp:BoundField HeaderText="Código" DataField="Codigo" />
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                <asp:BoundField HeaderText="Precio Venta" DataField="PrevioVenta" />
                <asp:BoundField HeaderText="Costo" DataField="Costo" />
                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Categoria" />
                <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />

            </Columns>

        </asp:GridView>
    </div>


</asp:Content>