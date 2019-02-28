<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="MetodoPago.aspx.cs" Inherits="CG_InvWeb.Catalogos.MetodoPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Método de pago" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/MetodoPago.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_metodo_pago" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
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
                            <dx:GridViewColumnLayoutItem ColumnName="metodo_pago">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem>
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descrip">
                            </dx:GridViewColumnLayoutItem>

                            <dx:GridViewColumnLayoutItem ColumnName="fecha_ini">
                            </dx:GridViewColumnLayoutItem>
                            <dx:GridViewColumnLayoutItem ColumnName="fecha_fin">
                            </dx:GridViewColumnLayoutItem>

                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_metodo_pago" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="metodo_pago" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Código">
                            <PropertiesTextEdit MaxLength="3">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descrip" Width="250px"  ShowInCustomizationForm="True" VisibleIndex="3" Caption="Método de pago">
                            <PropertiesTextEdit MaxLength="100">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_ini" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Fecha inicial">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_fin" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha final">
                        </dx:GridViewDataDateColumn>
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
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;c_Metodo_Pago&quot; WHERE &quot;key_metodo_pago&quot; = ?" InsertCommand="INSERT INTO &quot;c_Metodo_Pago&quot; (&quot;metodo_pago&quot;, &quot;descrip&quot;, &quot;fecha_ini&quot;, &quot;fecha_fin&quot;  ) VALUES ( ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_metodo_pago&quot;, &quot;metodo_pago&quot;, &quot;descrip&quot;,&quot;fecha_ini&quot;,&quot;fecha_fin&quot; FROM &quot;c_Metodo_Pago&quot; ORDER BY &quot;metodo_pago&quot;" UpdateCommand="UPDATE &quot;c_Metodo_Pago&quot; SET &quot;metodo_pago&quot; = ?, &quot;descrip&quot; = ?, &quot;fecha_ini&quot; = ?, &quot;fecha_fin&quot; = ?  WHERE &quot;key_metodo_pago&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_metodo_pago" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>                        
                        <asp:Parameter Name="metodo_pago" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />

                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="metodo_pago" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="key_metodo_pago" Type="Int64" />
                        <asp:Parameter Name="fecha_ini" Type="DateTime" />
                        <asp:Parameter Name="fecha_fin" Type="DateTime" />

                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

