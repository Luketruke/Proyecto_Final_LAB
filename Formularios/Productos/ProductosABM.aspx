<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ProductosABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.ProductosABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Productos</h2>

    <div class="mb-3">
        <label for="txtCodigo" class="form-label">Codigo</label>
        <asp:TextBox runat="server" id="txtCodigo" class="form-control"/>
    </div>

    <div class="mb-3">
        <label for="txtDescripcion" class="form-label">Descripcion</label>
        <asp:TextBox runat="server" id="txtDescripcion" class="form-control"/>
    </div>

    <div class="mb-3">
        <label for="txtPrecioVenta" class="form-label">Precio Venta</label>
        <asp:TextBox runat="server" id="txtPrecioVenta" class="form-control"/>
    </div>

    <div class="mb-3">
        <label for="txtCosto" class="form-label">Costo</label>
        <asp:TextBox runat="server" id="txtCosto" class="form-control"/>
    </div>

    <%--public CategoriaProducto Categoria { get; set; }
    public Marca Marca { get; set; }--%>

    <div class="mb-3">
        <label for="txtObservaciones" class="form-label">Observaciones</label>
        <asp:TextBox runat="server" id="txtObservaciones" class="form-control" TextMode="MultiLine"/>
    </div>

</asp:Content>
