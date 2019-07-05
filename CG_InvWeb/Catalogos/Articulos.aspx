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
    </style> 
<div class="Principal">          
    
    <dx:ASPxPageControl Width="100%" ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" EnableTabScrolling="True" EnableTheming="True" Theme="Moderno" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
        <TabPages>
            <dx:TabPage Name="bebes" Text="BEBÉS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView2" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings ShowGroupPanel="false"   showFooter="true" ShowGroupedColumns="true" ShowGroupFooter="VisibleAlways" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="1000">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AutoExpandAllGroups="true" AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Talla" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Familia" FieldName="familia" GroupIndex="0" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="1">
                                                    <PropertiesComboBox DataSourceID="SqlDataSourceFamilias" TextField="familia" ValueField="familia">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Marca" FieldName="marca" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <PropertiesComboBox DataSourceID="SqlDataSourceMarca" TextField="marca" ValueField="marca">
                                                    </PropertiesComboBox>
                                                    <EditItemTemplate>
                                                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl="~/Asigna_cia.aspx" Text="ASPxHyperLink" Theme="Glass" />
                                                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;marca&quot; FROM &quot;Marca&quot;"></asp:SqlDataSource>
                                                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource11" TextField="marca" Theme="Glass" ValueField="marca">
                                                        </dx:ASPxComboBox>
                                                        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server">
                                                            <ContentCollection>
                                                                <dx:PopupControlContentControl runat="server">
                                                                    <dx:ASPxGridView ID="ASPxGridView11" runat="server">
                                                                    </dx:ASPxGridView>
                                                                </dx:PopupControlContentControl>
                                                            </ContentCollection>
                                                        </dx:ASPxPopupControl>
                                                    </EditItemTemplate>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem  FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'BEBES'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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

                                        <asp:SqlDataSource ID="SqlDataSourceFamilias" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select distinct &quot;familia&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'BEBES'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                                        <asp:SqlDataSource ID="SqlDataSourceMarca" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_marca&quot;, &quot;marca&quot; FROM &quot;Marca&quot;"></asp:SqlDataSource>

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="niñas" Text="NIÑAS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView3" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="false" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AutoExpandAllGroups="true" AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'NIÑAS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="niños" Text="NIÑOS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView4" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'NIÑOS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="damas" Text="DAMAS">
                <ContentCollection>
                    <dx:ContentControl runat="server">           
                                        <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'DAMAS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="caballeros" Text="CABALLEROS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView5" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'CABALLEROS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="calzado" Text="CALZADO">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView9" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'ZAPATOS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="blancos" Text="BLANCOS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView8" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'BLANCOS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="accesorios" Text="ACCESORIOS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView7" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'ACCESORIOS'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="juguetes" Text="JUGUETES">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView6" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'JUGUETES'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="otros" Text="OTROS">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                                        <dx:ASPxGridView  ID="ASPxGridView10" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10" KeyFieldName="key_articulos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
                                            <Settings  ShowGroupPanel="true" ShowFooter="true" ShowGroupedColumns="false" ShowGroupFooter="Hidden" />
                                            <ClientSideEvents RowDblClick="function(s, e) {
                                                s.StartEditRow(e.visibleIndex);
                                            }" />
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsEditing Mode="PopupEditForm" >
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible"  />
                                            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm AllowResize="True" ShowHeader="true" CloseOnEscape="True" Modal="true" HorizontalAlign="Center" VerticalAlign="Middle"  />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <EditFormLayoutProperties ColCount="2">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="depto">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="familia">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descrip">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="marca">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="talla">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_lista">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="precio_contado">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="fecha_alta">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="descripcion">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:GridViewColumnLayoutItem ColumnName="articulo">
                                                    </dx:GridViewColumnLayoutItem>
                                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                                    </dx:EditModeCommandLayoutItem>
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="articulo" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descrip" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Descripción">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="marca"  ShowInCustomizationForm="True" VisibleIndex="3" GroupIndex="1" Caption="Marca">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="talla" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Talla">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_lista" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Precio crédito">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="precio_contado" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Precio contado">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha de alta">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="usuario_alta" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional1" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descripcion_adicional2" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="depto" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="familia" ShowInCustomizationForm="True" VisibleIndex="13" GroupIndex="0" Caption="Familia">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="key_articulos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem FieldName="Familia grupo" ShowInGroupFooterColumn="Familia" />
                                                <dx:ASPxSummaryItem FieldName="marca" ShowInGroupFooterColumn="Marca" />
                                            </GroupSummary>



                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;Articulos&quot; WHERE &quot;key_articulos&quot; = ?" InsertCommand="INSERT INTO &quot;Articulos&quot; (&quot;articulos&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot;) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="select &quot;articulo&quot;,&quot;descrip&quot;,&quot;marca&quot;,&quot;talla&quot;,&quot;precio_lista&quot;,&quot;precio_contado&quot;,&quot;fecha_alta&quot;,&quot;usuario_alta&quot;,&quot;descripcion&quot;,&quot;descripcion_adicional1&quot;,&quot;descripcion_adicional2&quot;, &quot;depto&quot;, &quot;familia&quot; ,&quot;key_articulos&quot; from &quot;Articulos&quot; where &quot;depto&quot; = 'SIN DEPARTAMENTO'" UpdateCommand="UPDATE &quot;articulo&quot;=?,&quot;descrip&quot;=?,&quot;marca&quot;= ?,&quot;talla&quot;= ?,&quot;precio_lista&quot;= ?,&quot;precio_contado&quot;= ?,&quot;fecha_alta&quot;= ?,&quot;usuario_alta&quot;= ?,&quot;descripcion&quot;= ?, &quot;descripcion_adicional1&quot;=?,&quot;descripcion_adicional2&quot;=?,
                                        &quot;depto&quot;= ?,&quot;familia&quot;= ?
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
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
    
</div>
</asp:Content>

