﻿using System;
using System.Web;
using System.Configuration;
using Npgsql;
using System.IO;

namespace CG_InvWeb
{
    public class GlobalHandler : IHttpModule
    {
        //Variable que utiliza Bitacora()
        string servidor = ConfigurationManager.ConnectionStrings["ServerPostgreSql"].ConnectionString.ToString();
        
        /// <summary>
        /// Deberá configurar este módulo en el archivo Web.config de su
        ///  web y registrarlo en IIS para poder usarlo. Para obtener más información
        /// consulte el vínculo siguiente: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region Miembros de IHttpModule

        public void Dispose()
        {
            //Ponga aquí el código de limpieza.
        }

        public void Init(HttpApplication context)
        {
            // El siguiente es un ejemplo de cómo se puede controlar el evento LogRequest y proporcionar 
            // una implementación de registro personalizado para él
            context.LogRequest += new EventHandler(OnLogRequest);
        }

        #endregion

        public void OnLogRequest(Object source, EventArgs e)
        {
            //Aquí puede poner la lógica de registro personalizado
        }



        //Guardar en la bitacora
        public void Bitacora(string accion_, string dato_anterior_, string dato_nuevo_, string usuario_, string autorizacion_, string tabla_)
        {/*
            try
            {*/
                var conexion = ConectarPostgresql();
                var fecha = DateTime.Now.ToString("dd-MM-yyyy");
                var hora = DateTime.Now.ToString("hh:mm:ss");
                NpgsqlCommand cmd = conexion.CreateCommand();
                cmd.CommandText = "INSERT INTO  \"Bitacora\" (accion, dato_anterior, dato_nuevo, fecha, hora, usuario, autorizacion, tabla) VALUES('" + accion_ + "','" + dato_anterior_ + "','" + dato_nuevo_ + "','" + fecha + "','" + hora + "','" + usuario_ + "','" + autorizacion_ + "','"+tabla_+"')";
                //cmd.Parameters.Add("@FechaHoy", SqlDbType.Date).Value = dateTimePicker1.Value;
                cmd.ExecuteNonQuery();
                conexion.Close();

            /*    //Al llamar está funcion guardar los datos 
            }catch (Exception erro)
            {
                guardarLog("NO SE GUARDO LA BITACORA "+erro.ToString());
            }*/
        }

        //CONEXION A LA BASE SIN ODBC || Listo 09/07/2019
        public NpgsqlConnection ConectarPostgresql()
        {
            NpgsqlConnection conexion = new NpgsqlConnection();

            if (!string.IsNullOrWhiteSpace(servidor))
            {
                try
                {
                    conexion = new NpgsqlConnection(servidor);
                    conexion.Open();

                }
                catch (Exception e)
                {
                    conexion.Close();
                }
            }

            return conexion;
        }

        //GUARDAR LOG DE ERRORES
        public void guardarLog(string descripcion_)
        {
            var dataFile = System.Web.Hosting.HostingEnvironment.MapPath("~/Archivos/log.txt"); //LINEA PARA GUARDAR EN SERVIDOR
            File.AppendAllText(dataFile, "FECHA: " + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + "  "+ descripcion_ +   Environment.NewLine);

            var dataFile2 = System.Web.Hosting.HostingEnvironment.MapPath("~/Archivos/temp.txt"); //LINEA PARA GUARDAR EN SERVIDOR
            File.WriteAllText(dataFile2, descripcion_);
        }

        public string obtenerError()
        {
            var dataFile = System.Web.Hosting.HostingEnvironment.MapPath("~/Archivos/temp.txt"); //LINEA PARA GUARDAR EN SERVIDOR
            string ultimoError = File.ReadAllText(dataFile);
            return ultimoError; 
        }
    }
}