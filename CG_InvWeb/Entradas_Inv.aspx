<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Entradas_Inv.aspx.cs" Inherits="CG_InvWeb.Entradas_Inv" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
    }
    .auto-style1 {
        margin-left: 0px;
        vertical-align:text-top;
        text-align:left;

    }
</style> 
<div class="Principal">          
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Entradas inventariables" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" AllowCollapsingByHeaderClick="True" HeaderNavigateUrl="~/Entradas_Inv.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SDSourceUsu" KeyFieldName="id_docto" OnCustomErrorText="ASPxGridView1_CustomErrorText3" style="margin-left: 0px" Theme="iOS" Width="100%" Font-Names="Century Gothic">
                    <SettingsPager PageSize="25">
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="3">
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" />
                    <SettingsBehavior ConfirmDelete="True" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <EditFormLayoutProperties ColCount="4">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="id_docto" Width="200px">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="year" Visible="False">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="mes" Visible="False">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="obra" Width="200px" RequiredMarkDisplayMode="Required">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha" Width="200px" RequiredMarkDisplayMode="Required">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="nombre" RequiredMarkDisplayMode="Required">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="tipo" RequiredMarkDisplayMode="Required" Width="200px">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="contrato" Caption="Contrato" RequiredMarkDisplayMode="Optional">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="remision" RequiredMarkDisplayMode="Required">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="orden_compra" Caption="Orden de compra" RequiredMarkDisplayMode="Optional">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_orden_compra" Caption="Fecha de orden de compra">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="factura" Caption="Factura">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="importe" RequiredMarkDisplayMode="Required">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="iva" RequiredMarkDisplayMode="Optional">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="total" RequiredMarkDisplayMode="Required">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="arch_docto" Caption="Archivo">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top" />
                        <SettingsItems Width="100%" />
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" >
                            <HeaderStyle Font-Names="Century Gothic"/>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="id_docto" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Código">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="year" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="mes" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Fecha">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="nombre" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Proveedor">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="tipo" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Tipo">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="remision" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Remisión">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="importe" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Importe">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="arch_docto" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="obra" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Obra">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="orden_compra" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_orden_compra" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="factura" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="contrato" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="iva" ShowInCustomizationForm="True" VisibleIndex="14" Caption="I.V.A.">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="total" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Total">
                            <HeaderStyle Font-Names="Century Gothic" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsCommandButton>
                        <NewButton>
                            <Image ToolTip="Nuevo registro" Url="Images/nuevo.png" />
                        </NewButton>
                        <EditButton>
                            <Image ToolTip="Modificar registro" Url="Images/edit.png" />
                        </EditButton>
                        <DeleteButton>
                            <Image ToolTip="Borrar registro" Url="Images/eliminar.png"/>
                        </DeleteButton>
                        <UpdateButton ButtonType="Image">
                            <Image ToolTip="Actualizar registro" Url="Images/guardar.png" />
                        </UpdateButton>
                        <CancelButton ButtonType="Image">
                            <Image ToolTip="Deshacer cambios" Url="Images/cancel.png" />
                        </CancelButton>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <br />
    <asp:SqlDataSource ID="SDSourceUsu" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id_docto], [year], [mes], [fecha], [nombre], [tipo], [remision], [importe], [arch_docto], [obra], [orden_compra], [fecha_orden_compra], [factura], [contrato], [iva], [total] FROM [Doctos]" DeleteCommand="DELETE FROM [Doctos] WHERE [id_docto] = @id_docto" InsertCommand="INSERT INTO [Doctos] ([id_docto], [year], [mes], [fecha], [nombre], [tipo], [remision], [importe], [arch_docto], [obra], [orden_compra], [fecha_orden_compra], [factura], [contrato], [iva], [total]) VALUES (@id_docto, @year, @mes, @fecha, @nombre, @tipo, @remision, @importe, @arch_docto, @obra, @orden_compra, @fecha_orden_compra, @factura, @contrato, @iva, @total)" UpdateCommand="UPDATE [Doctos] SET [year] = @year, [mes] = @mes, [fecha] = @fecha, [nombre] = @nombre, [tipo] = @tipo, [remision] = @remision, [importe] = @importe, [arch_docto] = @arch_docto, [obra] = @obra, [orden_compra] = @orden_compra, [fecha_orden_compra] = @fecha_orden_compra, [factura] = @factura, [contrato] = @contrato, [iva] = @iva, [total] = @total WHERE [id_docto] = @id_docto">
        <DeleteParameters>
            <asp:Parameter Name="id_docto" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_docto" Type="String" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="mes" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="remision" Type="String" />
            <asp:Parameter Name="importe" Type="Decimal" />
            <asp:Parameter Name="arch_docto" Type="String" />
            <asp:Parameter Name="obra" Type="String" />
            <asp:Parameter Name="orden_compra" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_orden_compra" />
            <asp:Parameter Name="factura" Type="String" />
            <asp:Parameter Name="contrato" Type="String" />
            <asp:Parameter Name="iva" Type="Decimal" />
            <asp:Parameter Name="total" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="mes" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="remision" Type="String" />
            <asp:Parameter Name="importe" Type="Decimal" />
            <asp:Parameter Name="arch_docto" Type="String" />
            <asp:Parameter Name="obra" Type="String" />
            <asp:Parameter Name="orden_compra" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_orden_compra" />
            <asp:Parameter Name="factura" Type="String" />
            <asp:Parameter Name="contrato" Type="String" />
            <asp:Parameter Name="iva" Type="Decimal" />
            <asp:Parameter Name="total" Type="Decimal" />
            <asp:Parameter Name="id_docto" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br />
<br />
<br />
<br />
</div>
</asp:Content>