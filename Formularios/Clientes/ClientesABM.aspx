<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ClientesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.ClientesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Clientes</h2>

    <br />

    <div class="mb-3">
        <label for="txtCodigo" class="form-label">Codigo</label>
        <asp:TextBox runat="server" ID="txtCodigo" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtCodigo" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtNombres" class="form-label">Nombres</label>
        <asp:TextBox runat="server" ID="txtNombres" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtNombres" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

     <div class="mb-3">
        <label for="txtApellidos" class="form-label">Apellidos</label>
        <asp:TextBox runat="server" ID="txtApellidos" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtApellidos" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
        <asp:TextBox runat="server" ID="txtFechaNacimiento" TextMode="Date" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtCuit" class="form-label">CUIT</label>
        <asp:TextBox runat="server" ID="txtCuit" class="form-control" MaxLength="15" onkeypress="javascript:return validarSoloNro(event)"/>
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
        <asp:TextBox runat="server" ID="txtEmail" placeholder="ejemplo@ejemplo.com" class="form-control" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" Text="Agregar" />
    </div>

    <script>
        //valida los campos solo numeros
        function validarSoloNro(e) {
            var key;
            if (window.event) // IE
            {
                key = e.keyCode;
            }
            else if (e.which) // Netscape/Firefox/Opera
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