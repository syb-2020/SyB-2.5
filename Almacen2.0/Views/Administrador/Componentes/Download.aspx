<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Donwload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- estilos de animación banner-->
        <style>         
           .gear {
               float: left;
               font-size: 30px;
               animation-name: rotate-gear;
               animation-duration: 2s;
               animation-iteration-count: infinite;
               animation-timing-function: linear;
           }

           @keyframes rotate-gear {
               from {
                   transform: rotateZ(0deg);
               }

               to {
                   transform: rotateZ(360deg);
               }
           }

           #logotipo:hover .gear{
               animation: fromBellow 500ms linear;
           }

           @keyframes fromBellow {
               0% {
                   transform: translateY(0%);
               }

               50% {
                   transform: translateY(200%);
               }

               100% {
                   transform: translateY(0%);
               }
           }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="idprincipal" runat="server">
     <div>
    
    </div>
</asp:Content>
