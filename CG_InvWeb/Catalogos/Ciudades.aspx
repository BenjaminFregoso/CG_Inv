<%@ Page Title="Régimen Fiscal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Ciudades.aspx.cs" Inherits="CG_InvWeb.Catalogos.Ciudades" %>

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
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" HorizontalAlign="Left" runat="server" HeaderText="Ciudades" ShowCollapseButton="True" Theme="iOS" Width="100%" Font-Names="Century Gothic" CssClass="auto-style1" Height="100%" HeaderNavigateUrl="~/Catalogos/Ciudades.aspx">
        <LoadingPanelStyle HorizontalAlign="Left" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent runat="server">                
                <dx:ASPxGridView  ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="key_ciudad" EnableTheming="True" Theme="Glass" OnRowInserting="ASPxGridView1_RowInserting" OnInitNewRow="ASPxGridView1_InitNewRow" OnCustomErrorText="ASPxGridView1_CustomErrorText" SettingsBehavior-ColumnResizeMode="Control" >
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
                            <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="descrip">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem ColSpan="2">
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="estado">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EmptyLayoutItem ColSpan="2">
                            </dx:EmptyLayoutItem>
                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="pais">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Image">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="key_ciudad" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="descrip" Width="250px"  ShowInCustomizationForm="True" VisibleIndex="3" Caption="Ciudad">
                            <PropertiesTextEdit MaxLength="100">
                                <ValidationSettings SetFocusOnError="True">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Estado" Width="250px" FieldName="estado" ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesComboBox DataSourceID="SqlDataSource2" TextField="descrip" ValueField="descrip">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Código" FieldName="estado" Width="50px" />
                                    <dx:ListBoxColumn Caption="Estado" FieldName="descrip" />
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="País" Width="250px" FieldName="pais" ShowInCustomizationForm="True" VisibleIndex="5">
                            <PropertiesComboBox DataSourceID="SqlDataSource3" TextField="descrip" ValueField="descrip">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Código" FieldName="pais" Width="50px" />
                                    <dx:ListBoxColumn Caption="País" FieldName="descrip" />
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" DeleteCommand="DELETE FROM &quot;c_Ciudades&quot; WHERE &quot;key_ciudad&quot; = ?" InsertCommand="INSERT INTO &quot;c_Ciudades&quot; (&quot;descrip&quot;,&quot;estado&quot;,&quot;pais&quot; ) VALUES (?,?,?)" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;key_ciudad&quot;, &quot;descrip&quot;,&quot;estado&quot;,&quot;pais&quot; FROM &quot;c_Ciudades&quot; ORDER BY &quot;descrip&quot;" UpdateCommand="UPDATE &quot;c_Ciudades&quot; SET &quot;descrip&quot; = ?,&quot;estado&quot; =?,&quot;pais&quot; = ? WHERE &quot;key_ciudad&quot; = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="key_ciudad" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="estado" Type="String" />
                        <asp:Parameter Name="pais" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="descrip" Type="String" />
                        <asp:Parameter Name="estado" Type="String" />
                        <asp:Parameter Name="pais" Type="String" />
                        <asp:Parameter Name="key_ciudad" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;descrip&quot;, &quot;estado&quot; FROM &quot;c_Estado&quot;"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CG_001ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:CG_001ConnectionString1.ProviderName %>" SelectCommand="SELECT &quot;descrip&quot;, &quot;pais&quot; FROM &quot;c_Pais&quot;"></asp:SqlDataSource>
                
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</div>
</asp:Content>

