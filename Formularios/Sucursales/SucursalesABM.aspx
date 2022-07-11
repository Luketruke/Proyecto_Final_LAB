<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="SucursalesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Sucursales.SucursalesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Title %>Sucursales</h2>
    <br />
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtNombre" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtDireccion" class="form-label">Direccion</label>
                <asp:TextBox runat="server" ID="txtDireccion" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtDireccion" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtLocalidad" class="form-label">Localidad</label>
                <asp:TextBox runat="server" ID="txtLocalidad" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtLocalidad" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtCodigoPostal" class="form-label">Codigo Postal</label>
                <asp:TextBox runat="server" ID="txtCodigoPostal" class="form-control"/>
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                <asp:Button ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
            </div>

</asp:Content>