﻿<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<h2><%: Title %>Productos</h2>--%>
    <div>
        <table style="width: 100%" class="table table-striped table-bordered">
            <tbody>
                <tr>
                    <td style="width: 60%">
                        <div class="form-group">
                            <label style="font-size: 20px;" class="col-md-2">Herramientas</label>
                        </div>
                    </td>
                    <td style="width: 1%">
                        <div class="col-md-1">
                            <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <br />
    <br />

    <div>
        <asp:GridView ID="dgvProductos" runat="server" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Precio Venta" DataField="PrecioVenta" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Marca" DataField="Marca" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Categoria" DataField="Categoria" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100" HeaderStyle-Width="100" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-pencil"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Estas seguro de eliminar el producto?');">
                            <i class="fa-solid fa-trash"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
