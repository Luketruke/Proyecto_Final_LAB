<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../Site.Master" CodeBehind="StockABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.StockProductos.StockABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display: flex; justify-content: center;">
        <asp:Label id="lblStockTotal" runat="server" Style="font-size: 56px; font-weight: bold;"></asp:Label>
    </div>

    <br />

    <div>
        <asp:GridView ID="dgvStock" runat="server" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Producto" DataField="Producto.Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Stock" DataField="StockActual" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Stock Minimo" DataField="StockMinimo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Sucursal" DataField="Sucursal.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="120" HeaderStyle-Width="120" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Editar">
                            <i class="fa-solid fa-pencil"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnStockHistorico" OnClick="btnStockHistorico_Click" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Historico">
                            <i class="fa-solid fa-boxes-stacked"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

     <script>
         $(function () {
             $('[data-toggle="tooltip"]').tooltip()
         })
     </script>

</asp:Content>