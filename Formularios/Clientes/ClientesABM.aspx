<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ClientesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.ClientesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Clientes</h2>

    <br />

    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled=""/>
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtCodigo" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtNombres" class="form-label">Nombres</label>
                <asp:TextBox runat="server" ID="txtNombres" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtNombres" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtApellidos" class="form-label">Apellidos</label>
                <asp:TextBox runat="server" ID="txtApellidos" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtApellidos" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" ID="txtFechaNacimiento" TextMode="Date" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtCuit" class="form-label">CUIT</label>
                <asp:TextBox runat="server" ID="txtCuit" class="form-control" MaxLength="15" onkeypress="javascript:return validarSoloNro(event)" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtCuit" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtTelefono" class="form-label">Telefono</label>
                <asp:TextBox runat="server" ID="txtTelefono" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" placeholder="ejemplo@ejemplo.com" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                <asp:Button ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
            </div>
        </div>

        <div class="col-md-6">

            <div>
                <label for="ddlTipoCliente" class="form-label">Tipo Cliente</label>
                <asp:DropDownList ID="ddlTipoCliente" CssClass="form-select" runat="server"></asp:DropDownList>
                <br />
            </div>

            <div class="mb-3">
                <label for="txtDomicilio" class="form-label">Domicilio</label>
                <asp:TextBox runat="server" ID="txtDomicilio" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtDomicilio" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtLocalidad" class="form-label">Localidad</label>
                <asp:TextBox runat="server" ID="txtLocalidad" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtLocalidad" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtCodigoPostal" class="form-label">Codigo Postal</label>
                <asp:TextBox runat="server" ID="txtCodigoPostal" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtObservaciones" class="form-label">Observaciones Direccion</label>
                <asp:TextBox runat="server" ID="txtObservaciones" class="form-control" TextMode="MultiLine" Rows="8" />
            </div>
        </div>
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