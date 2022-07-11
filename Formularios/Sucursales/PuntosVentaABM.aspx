<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="PuntosVentaABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Sucursales.PuntosVentaABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Title %>Puntos de Venta</h2>
    <br />
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero</label>
                <asp:TextBox runat="server" ID="txtNumero" class="form-control" MaxLength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"/>
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtNumero" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtNombre" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                <asp:Button ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
            </div>
</asp:Content>