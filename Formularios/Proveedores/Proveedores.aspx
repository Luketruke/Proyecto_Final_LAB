<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Proveedores.ProveedoresABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>  
    <table style="width: 100%">
        <tbody>
            <tr>
                <td style="width: 90%">
                    <div class="form-group">
                        <label class="col-md-2">Lista de Proveedores:</label>
                        
                    </div>
                </td>
                <td style="width: 30%"></td>
                <td style="width: 10%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:LinkButton href="ProveedoresABM.aspx" ID="btnAgregar" class="btn btn-secondary btn-lg" Text="Agregar" runat="server"></asp:LinkButton>
                        </div>
                    </div>
                </td>
            </tr>       
        </tbody>
    </table>
    <div>
    <asp:GridView ID="dgvProveedores" runat="server"  CssClass=" table"></asp:GridView>
    </div>

</asp:Content>