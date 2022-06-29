<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="MarcasABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.MarcasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Marcas</h2>

    <table style="width: 100%">
        <tbody>
            <tr>
                <td style="width: 60%">
                    <div class="form-group">
                        <label class="col-md-2">Marca</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtMarca" class="form-control" />
                        </div>
                    </div>
                </td>
                <td style="width: 30%"></td>
                <td style="width: 10%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" class="btn btn-success" runat="server" Text="Agregar"/>
                        </div>
                    </div>
                </td>
            </tr>

        </tbody>
    </table>

    <br />
    <br />

    <div>
        <asp:GridView ID="dgvMarcas" runat="server" CssClass="table table-dark table-bordered"></asp:GridView>
    </div>

</asp:Content>