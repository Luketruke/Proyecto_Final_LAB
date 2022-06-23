<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="CategoriasABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.CategoriasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Categorias</h2>

    <table style="width: 100%">
        <tbody>
            <tr>
                <td style="width: 60%">
                    <div class="form-group">
                        <label class="col-md-2">Categoria</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtCategoria" class="form-control" />
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

    <div class="col-md-12 col-xs-12">
        <asp:GridView ID="dgvCategorias" runat="server" CssClass="table"></asp:GridView>
    </div>

</asp:Content>
