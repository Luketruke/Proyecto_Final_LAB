<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ProveedoresABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Proveedores.ProveedoresABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
     <table style="width: 100%">
        <tbody>
            <tr>
                <td style="width: 60%">
                    <div class="form-group">
                        <label class="col-md-2">Proveedor a cargar:</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtProveedor" class="form-control" />
                        </div>
                    </div>
                </td>
                <td style="width: 30%"></td>
                <td style="width: 10%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:Button ID="btnAgregarPv" runat="server" Text="Agregar" />
                        </div>
                    </div>
                </td>
            </tr>

        </tbody>
    </table>

</asp:Content>