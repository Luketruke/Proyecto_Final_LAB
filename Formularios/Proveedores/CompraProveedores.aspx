<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompraProveedores.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Proveedores.CompraProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link rel="stylesheet" href="../../Content/Varios.css" />


        <ContentTemplate>
            <div class="col-md-12" style="padding: 0px;">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Proveedor</th>
                            <th>Fecha Emisión</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 40%">
                                <div class="form-group">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtProveedor" class="form-control" />                            
                                    </div>                              
                                </div>
                             
                            </td>
                            <td style="width: 60%">
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <asp:TextBox runat="server" ID="txtFechaFactura" TextMode="Date" class="form-control" />
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

</asp:Content>
