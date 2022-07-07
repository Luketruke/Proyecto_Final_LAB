<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedoresABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Proveedores.ProveedoresABM1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Proveedor</h1>
    <br />

    <div class="mb-3">
        <label for="txtCodigo" class="form-label">Codigo</label>       
        <asp:TextBox runat="server" ID="txtCodigo" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtCodigo" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
    <div class="mb-3">
        <label for="txtRazonSocial" class="form-label">Razon Social</label>       
        <asp:TextBox runat="server" ID="txtRazonSocial" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtRazonSocial" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
      <div class="mb-3">
        <label for="txtCUIT" class="form-label">CUIT</label>       
        <asp:TextBox runat="server" ID="txtCUIT" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtCuit" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
     <div class="mb-3">
        <label for="txtDomicilio" class="form-label">Domicilio</label>       
        <asp:TextBox runat="server" ID="txtDomicilio" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtDomicilio" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
      <div class="mb-3">
        <label for="txtTelefono" class="form-label">Telefono</label>       
        <asp:TextBox runat="server" ID="txtTelefono" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
      <div class="mb-3">
        <label for="txtEmail" class="form-label">Email</label>       
        <asp:TextBox runat="server" ID="txtEmail" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

   <br />
  
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" class="btn btn-success" visible="true"/>
    <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" CssClass="btn btn-success" visible="false"/>      
                      
    <script>
        //valida los campos solo numeros 
        function validarSoloNro(e) {
            var key;
            if (window.event) 
            {
                key = e.keyCode;
            }
            else if (e.which) 
            {
                key = e.which;
            }

            if (key < 48 || key > 57) {
                return false;
            }
            else { return true; }
        }
    </script>

</asp:Content>
