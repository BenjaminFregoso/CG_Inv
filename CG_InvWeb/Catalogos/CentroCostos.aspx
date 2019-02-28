<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CentroCostos.aspx.cs" Inherits="CG_InvWeb.Catalogos.CentroCostos" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Centros de costos" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/CentroCostos.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_centro_costos" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
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
                            <dx:GridViewColumnLayoutItem ColumnName="cc">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem>
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descrip">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_centro_costos" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="cc" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Código">
                            <PropertiesTextEdit MaxLength="3" HelpText="3 dígitos alfanuméricos" NullText="A01">
                                <MaskSettings Mask="AAA" />
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descrip" Width="250px"  ShowInCustomizationForm="True" VisibleIndex="3" Caption="Régimen Fiscal">
                            <PropertiesTextEdit MaxLength="100">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
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
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;CentroCostos&quot; WHERE &quot;key_centro_costos&quot; = ?" InsertCommand="INSERT INTO &quot;CentroCostos&quot; (&quot;cc&quot;, &quot;descrip&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_centro_costos&quot;, &quot;cc&quot;, &quot;descrip&quot; FROM &quot;CentroCostos&quot; ORDER BY &quot;cc&quot;" UpdateCommand="UPDATE &quot;CentroCostos&quot; SET &quot;cc&quot; = ?, &quot;descrip&quot; = ? WHERE &quot;key_centro_costos&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_centro_costos" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cc" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cc" Type="String" />
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="key_centro_costos" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

