<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="entrada.aspx.cs" Inherits="Doctos_eje2.DeviceMobile.entrada" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v18.2.Core, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

        <style type="text/css" media="screen">
            .Titulo{
            width:100%;
            text-align:left;            
            }

            .Entrada_p1{
            /*    text-align:center;
            width:200px;
            padding-right:40px;
            background-color:#95C3F0;
            text-align:left;                        
            float:left;*/
            }

        </style>

        <div id="id_Entrada_p1" style="text-align:center; margin:0 auto; width:100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="COMPRAS" ShowCollapseButton="true" Theme="Moderno" ForeColor="#336600" HorizontalAlign="Center" Width="100%" >
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" KeyFieldName="key_usuario" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMovtosDet" EnableTheming="True" Theme="iOS">
                            <ClientSideEvents RowClick="function(s, e) {}" SelectionChanged="function(s, e) {}" />
                            <Settings VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="True" HideDataCellsAtWindowInnerWidth="800">
                                <AdaptiveDetailLayoutProperties ShowItemCaptionColon="False">
                                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="800">
                                    </SettingsAdaptivity>
                                    <SettingsItemCaptions Location="Bottom" />
                                </AdaptiveDetailLayoutProperties>
                            </SettingsAdaptivity>
                            <SettingsBehavior AllowEllipsisInText="true" ConfirmDelete="True"/>
                            <SettingsPopup>
                                <EditForm AllowResize="True" CloseOnEscape="True" HorizontalAlign="LeftSides" ShowCollapseButton="True" ShowFooter="True" ShowMaximizeButton="True" ShowPageScrollbarWhenModal="True" ShowPinButton="True" ShowShadow="True" ShowViewportScrollbarWhenModal="True" VerticalAlign="Above">
                                    <SettingsAdaptivity Mode="OnWindowInnerWidth" />
                                </EditForm>
                            </SettingsPopup>
                            <EditFormLayoutProperties>
                                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
                                </SettingsAdaptivity>
                                <SettingsItemCaptions Location="Top" />
                            </EditFormLayoutProperties>
                            <SettingsEditing Mode="PopupEditForm">
                            </SettingsEditing>
                            <SettingsPager PageSize="40" NumericButtonCount="6" Visible="False">
                            </SettingsPager>                            
                            <Styles>
                                <Cell Wrap="False" />
                            </Styles>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" MinWidth="30" MaxWidth="50" Width="5%" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="key_usuario" ShowInCustomizationForm="True" MinWidth="30" MaxWidth="60" VisibleIndex="1" ReadOnly="True">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="usuario" ShowInCustomizationForm="True"  VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="contrasena" ShowInCustomizationForm="True"  VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="perfil" ShowInCustomizationForm="True"  VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="empresa" ShowInCustomizationForm="True"  VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="nombre" ShowInCustomizationForm="True"  VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="fecha_baja" ShowInCustomizationForm="True"  VisibleIndex="7">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataDateColumn FieldName="fecha_alta" ShowInCustomizationForm="True"  VisibleIndex="8">
                                </dx:GridViewDataDateColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSourceMovtosDet" runat="server" ConnectionString="<%$ ConnectionStrings:ServerPostgreSqlODBC %>" SelectCommand="SELECT key_usuario, usuario, contrasena, perfil, empresa, nombre, fecha_baja, fecha_alta FROM &quot;Usuarios&quot;" ProviderName="<%$ ConnectionStrings:ServerPostgreSqlODBC.ProviderName %>"></asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>

        </asp:Content>
