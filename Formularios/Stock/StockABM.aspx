<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../../Site.Master" CodeBehind="StockABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.StockProductos.StockABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display: flex; justify-content: center;">
        <asp:Label ID="lblStockTotal" runat="server" Style="font-size: 56px; font-weight: bold;"></asp:Label>
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
                        <asp:LinkButton ID="btnEditarStock" runat="server" OnClick="btnEditarStock_Click" OnClientClick="openModal();" CssClass="btn btn-info" AutoPostBack="true">
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

    <div id="modalModificarStock" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Editar stock</h2>
                </div>
                <div class="modal-body">
                    <row>
                        <div class="col-md-3">
                            <asp:Label Text="Nuevo stock" runat="server" Style="font-weight: bold; text-align: center" />
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox runat="server" ID="txtStockAgregar" MaxLength="10" class="form-control" oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\--*)\-/g, '$1');"/>
                        </div>
                        <div class="col-md-2">
                            <asp:LinkButton ID="btnAceptar" OnClick="btnAceptar_Click" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Aceptar">
                            <i class="fa-solid fa-check"></i>
                            </asp:LinkButton>
                        </div>
                    </row>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalStockHistorico" class="modal fade" role="dialog" >
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Stock historico</h2>
                </div>
                <div class="modal-body" style="height: 50vh; overflow-y: auto;">
                    <asp:GridView ID="dgvStockHistorico" runat="server" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Cantidad" DataField="StockActual" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField HeaderText="Fecha" DataField="FechaMovStock" DataFormatString="{0:d}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openModal() {
            $('[id*=modalModificarStock]').modal('show');
        }
        function closeModal() {
            $('[id*=modalModificarStock]').modal('hide');
        }
    </script>

    <script type="text/javascript">
        function openModalStockHistorico() {
            $('[id*=modalStockHistorico]').modal('show');
        }
        function closeModalStockHistorico() {
            $('[id*=modalStockHistorico]').modal('hide');
        }
    </script>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

</asp:Content>
