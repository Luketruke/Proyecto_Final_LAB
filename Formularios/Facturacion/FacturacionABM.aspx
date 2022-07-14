<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="FacturacionABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Facturacion.FacturacionABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="../../Content/Varios.css" />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="col-md-12" style="padding: 0px;">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Datos Cliente</th>
                            <th>Datos Factura</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 40%">
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtCliente" class="form-control" />
                                        <asp:DropDownList ID="ddlClientes" CssClass="form-select" runat="server"
                                            OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:LinkButton ID="btnBuscar" runat="server" CssClass="btn btn-info" OnClick="btnBuscar_Click" AutoPostBack="true" data-toggle="tooltip" ToolTip="Filtrar">
                            <i class="fa-solid fa-search"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 60%">
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <asp:TextBox runat="server" ID="txtFechaFactura" ReadOnly="true" TextMode="Date" class="form-control" />
                                    </div>
                                    <div class="col-md-9" style="text-align: right">
                                        <asp:Label class="labels" ID="lblTipoFactura" runat="server" />
                                        <asp:Label class="labels" ID="lblNroFactura" runat="server" />
                                    </div>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>


            <div class="col-md-12" style="padding: 0px;">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th style="width: 30%">
                                <label class="col-md-4">Vendedor</label>
                            </th>
                            <th style="width: 25%">
                                <label class="col-md-4">FormasPago</label>
                            </th>
                            <th style="width: 25%">
                                <label class="col-md-4">Sucursal</label>
                            </th>
                            <th style="width: 20%">
                                <label class="col-md-4">PuntoVenta</label>
                            </th>
                        </tr>
                        <tr>
                            <th style="width: 30%">
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlVendedor" CssClass="form-select" runat="server"></asp:DropDownList>
                                </div>
                            </th>
                            <th style="width: 20%">
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlFormaPago" CssClass="form-select" runat="server"></asp:DropDownList>
                                </div>
                            </th>
                            <th style="width: 25%">
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlSucursal" CssClass="form-select" runat="server"
                                        OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                </div>
                            </th>
                            <th style="width: 25%">
                                <div class="col-md-12" style="padding-left: 0%; padding-right: 0%;">
                                    <asp:DropDownList ID="ddlPuntoVenta" CssClass="form-select" runat="server"
                                        OnSelectedIndexChanged="ddlPuntoVenta_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                </div>
                            </th>
                        </tr>
                    </thead>
                </table>
            </div>

            <div>
                <table class="table table-striped table-bordered">

                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Cantidad</th>
                            <th>Descripcion</th>
                            <th>Desc. %</th>
                            <th>Precio</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 25%">
                                <div class="col-md-8">
                                    <asp:TextBox runat="server" ID="txtCodigoProducto" class="form-control" disabled="" />
                                    <label class="col-md-4"></label>
                                </div>
                                <asp:LinkButton ID="btnModalItemsFactura" runat="server" CssClass="btn btn-info" data-target="#myModal" data-toggle="modal">
                            <i class="fa-solid fa-search"></i>
                                </asp:LinkButton>
                            </td>
                            <td style="width: 12%">
                                <asp:TextBox runat="server" ID="txtId" class="form-control" Visible="false" />
                                <asp:TextBox runat="server" ID="txtCantidad" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
                            </td>
                            <td style="width: 25%">
                                <asp:TextBox runat="server" ID="txtDescripcion" class="form-control" disabled="" />
                            </td>
                            <td style="width: 7%">
                                <asp:TextBox runat="server" ID="txtDescuento" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
                            </td>
                            <td style="width: 14%">
                                <div class="input-group">
                                    <span class="input-group-addon">$</span>
                                    <input type="number" id="txtPrecio" class="form-control col-md-4" disabled="" runat="server">
                                </div>
                            </td>
                            <td style="width: 3%">
                                <asp:LinkButton ID="btnAgregarProducto" runat="server" CssClass="btn btn-info" OnClick="btnAgregarProducto_Click" AutoPostBack="true" data-toggle="tooltip" ToolTip="Agregar">
                            <i class="fa-solid fa-plus"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div>
                <asp:GridView ID="dgvItemsFactura" runat="server" DataKeyNames="NumeroItem" CssClass="table table-bordered border-primary" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Nro Item" DataField="NumeroItem" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" Visible="false" />
                        <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Descripción" DataField="Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Descuento" DataField="Descuento" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="PrecioVenta" DataField="PrecioVenta" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="PrecioTotal" DataField="PrecioTotal" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100" HeaderStyle-Width="100" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnBorrarItem" runat="server" CssClass="btn btn-info" OnClick="btnBorrarItem_Click" AutoPostBack="true" data-toggle="tooltip" ToolTip="Quitar">
                            <i class="fa-solid fa-trash"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="row">
                <div class="col-md-7">
                    <div class="mb-3">
                        <label for="txtObservaciones" class="form-label">Observaciones</label>
                        <asp:TextBox runat="server" ID="txtObservaciones" class="form-control" TextMode="MultiLine" Rows="4" />
                    </div>

                    <div class="mb-3">
                        <asp:Button ID="btnFacturar" runat="server" CssClass="btn btn-success" Text="Facturar" OnClick="btnFacturar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </div>
                    <div>
                    </div>
                </div>

                <div class="col-md-5 pull-right" style="margin-right: -15px;">
                    <table class="table table-striped table-bordered">
                        <tbody>
                            <tr>
                                <td>
                                    <div role="form" class="form-horizontal col-md-12">
                                        <div class="form-group" style="text-align: left">
                                            <label class="col-md-3">Descuento:</label>
                                            <div class="col-md-5">
                                                <div class="input-group">
                                                    <span class="input-group-addon">$</span>
                                                    <input type="number" id="txtDescuentoFactura" class="form-control col-md-4" style="text-align: right" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <asp:LinkButton ID="btnDescuentoFactura" OnClick="btnDescuentoFactura_Click" runat="server" CssClass="btn btn-info" AutoPostBack="true" data-toggle="tooltip" ToolTip="Agregar descuento">
                            <i class="fa-solid fa-plus"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="form-group" style="text-align: left">
                                            <label class="col-md-3">SubTotal: </label>
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon">$</span>
                                                    <input type="number" id="txtSubtotalFactura" class="form-control col-md-4" disabled="" style="text-align: right" runat="server">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group" style="text-align: left">
                                            <strong>
                                                <label class="col-md-3">Total:</label></strong>
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    <span class="input-group-addon">$</span>
                                                    <input type="number" id="txtTotalFactura" class="form-control col-md-4" disabled="" style="text-align: right" runat="server">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-5">
                        <div>
                            <input type="text" id="txtFiltrarProductos" placeholder="Ingrese descripcion..." class="form-control col-md-4" runat="server">
                        </div>
                    </div>
                    <div class="col-md-1">
                        <asp:LinkButton ID="btnFiltrarProductos" OnClick="btnFiltrarProductos_Click" runat="server" CssClass="btn btn-info" AutoPostBack="true" data-toggle="tooltip" ToolTip="Filtrar">
                            <i class="fa-solid fa-search"></i>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="modal-body" style="height: 40vh; overflow-y: auto;">
                    <div>
                        <asp:GridView ID="dgvProductos" runat="server" DataKeyNames="Id" CssClass="table table-bordered border-primary" AutoGenerateColumns="false" AutoPostBack="true">
                            <Columns>
                                <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField HeaderText="Descripción" DataField="Descripcion" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField HeaderText="Stock" DataField="Stock.StockActual" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:BoundField HeaderText="PrecioVenta" DataField="PrecioVenta" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                                <asp:TemplateField HeaderText="Agregar" ItemStyle-Width="35" HeaderStyle-Width="35" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnAgregarItem" runat="server" CssClass="btn btn-info" OnClick="btnAgregarItem_Click" OnClientClick="closeModal();" data-toggle="tooltip" ToolTip="Agregar">
                            <i class="fa-solid fa-plus"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
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
            $('[id*=myModal]').modal('show');
        }
        function closeModal() {
            $('[id*=myModal]').modal('hide');
        }
    </script>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

</asp:Content>
