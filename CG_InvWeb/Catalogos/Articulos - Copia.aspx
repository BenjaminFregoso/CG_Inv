<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="CG_InvWeb.Catalogos.Articulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        Principal{
        width:80%;
        margin-top:20px;
        padding-left:20px;
        padding-top:20px;
        font-family :'Century Gothic';
    }
    .auto-style1 {
        margin-left: 0px;
        vertical-align:text-top;
        text-align:left;
        font-family :'Century Gothic';
    }
</style> 
<div class="Principal">          
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Artículos" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/Articulos.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                    <ClientSideEvents RowDblClick="function(s, e) {
                        s.StartEditRow(e.visibleIndex);
                    }" />
                    <SettingsEditing Mode="PopupEditForm" >
                    </SettingsEditing>
                    <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                    <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
                    <SettingsSearchPanel Visible="True" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </SettingsPopup>
                    <EditFormLayoutProperties ColCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="depto">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="familia">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="familia_sub">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="old_descripcion">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="old_marca">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="old_talla">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="old_codigo">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="old_codigo" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Código anterior">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="old_descripcion" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Artículo">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="old_marca"  ShowInCustomizationForm="True" VisibleIndex="6" Caption="Marca">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Talla" FieldName="old_talla" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Precio de lista" FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Precio contado" FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Fecha de alta">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descripción" FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="key_depto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="key_familia" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="key_familia_sub" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Departamento" FieldName="depto" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" GroupIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Familia" FieldName="familia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" GroupIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sub-Familia" FieldName="familia_sub" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="2">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsCommandButton>
                        <NewButton>
                            <Image ToolTip="Nuevo registro" Url="~/Images/nuevo.png" />
                        </NewButton>
                        <EditButton>
                            <Image ToolTip="Modificar registro" Url="~/Images/edit.png" />
                        </EditButton>
                        <DeleteButton>
                            <Image ToolTip="Borrar registro" Url="~/Images/eliminar.png"/>
                        </DeleteButton>
                        <UpdateButton ButtonType="Image">
                            <Image ToolTip="Actualizar registro" Url="~/Images/guardar.png" />
                        </UpdateButton>
                        <CancelButton ButtonType="Image">
                            <Image ToolTip="Deshacer cambios" Url="~/Images/cancel.png" />
                        </CancelButton>
                    </SettingsCommandButton>
                    <Settings ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="true" ShowGroupFooter="VisibleAlways" />
                    <GroupSummary>
                        <dx:ASPxSummaryItem FieldName="Depto" ShowInGroupFooterColumn="Depto" />
                        <dx:ASPxSummaryItem FieldName="Familia" ShowInGroupFooterColumn="Familia" />
                        <dx:ASPxSummaryItem FieldName="Familia_sub" ShowInGroupFooterColumn="Familia_sub" />
                    </GroupSummary>



                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;old_codigo&quot;,&quot;old_descripcion&quot;,&quot;old_marca&quot;,&quot;old_talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,
&quot;key_depto&quot;,&quot;key_familia&quot;,&quot;key_familia_sub&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;old_codigo&quot;,&quot;old_descripcion&quot;,&quot;old_marca&quot;,&quot;old_talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,
&quot;key_depto&quot;,&quot;key_familia&quot;,&quot;key_familia_sub&quot;,&quot;key_articulos&quot;,
( select &quot;descripcion_depto&quot; from &quot;Departamento&quot; where &quot;Departamento&quot;.&quot;key_depto&quot; = &quot;Articulos&quot;.&quot;key_depto&quot; ) as Depto,
( select &quot;descripcion_familia&quot; from &quot;Familia&quot; where &quot;Familia&quot;.&quot;key_familia&quot; = &quot;Articulos&quot;.&quot;key_familia&quot; ) as Familia,
( select &quot;descripcion_familia_sub&quot; from &quot;Familia_sub&quot; where &quot;Familia_sub&quot;.&quot;key_familia_sub&quot; = &quot;Articulos&quot;.&quot;key_familia_sub&quot; ) as Familia_sub
from &quot;Articulos&quot; order by Depto,Familia,Familia_sub " UpdateCommand="UPDATE &quot;old_codigo&quot;=?,&quot;old_descripcion&quot;=?,&quot;old_marca&quot;= ?,&quot;old_talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?,
&quot;key_depto&quot;= ?,&quot;key_familia&quot;= ?,&quot;key_familia_sub&quot;= ?,&quot;key_articulos&quot;= ?
 WHERE &quot;key_articulos&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_articulos" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="old_codigo" Type="String" />
                        <asp:Parameter Name="old_descripcion" Type="String" />
                        <asp:Parameter Name="old_marca" Type="String" />
                        <asp:Parameter Name="old_talla" Type="String" />
                        <asp:Parameter Name="precio_lista" Type="Decimal" />
                        <asp:Parameter Name="precio_contado" Type="Decimal" />
                        <asp:Parameter Name="fecha_alta" Type="DateTime" />
                        <asp:Parameter Name="usuario_alta" Type="String" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="key_depto" Type="Int64" />
                        <asp:Parameter Name="key_familia" Type="Int64" />
                        <asp:Parameter Name="key_familia_sub" Type="Int64" />                        
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="old_codigo" Type="String" />
                        <asp:Parameter Name="old_descripcion" Type="String" />
                        <asp:Parameter Name="old_marca" Type="String" />
                        <asp:Parameter Name="old_talla" Type="String" />
                        <asp:Parameter Name="precio_lista" Type="Decimal" />
                        <asp:Parameter Name="precio_contado" Type="Decimal" />
                        <asp:Parameter Name="fecha_alta" Type="DateTime" />
                        <asp:Parameter Name="usuario_alta" Type="String" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="key_depto" Type="Int64" />
                        <asp:Parameter Name="key_familia" Type="Int64" />
                        <asp:Parameter Name="key_familia_sub" Type="Int64" />
                        <asp:Parameter Name="key_articulos" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

