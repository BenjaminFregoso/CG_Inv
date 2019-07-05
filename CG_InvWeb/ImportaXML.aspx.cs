using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Xml;
using System.Xml.Linq;

namespace CG_InvWeb
{
    public partial class ImportaXML : System.Web.UI.Page
    {
        string sRuta;
        string[] files;
        protected void Page_Load(object sender, EventArgs e)
        {
            using ( SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString()))
            {
                try
                {
                    sqlConnection1.Open();
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader reader;

                    cmd.CommandText = "select ruta from configuraciones";
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = sqlConnection1;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        sRuta = reader["ruta"].ToString();
                        //int nLenRuta = (sRuta.Length +1);
                        files = Directory.GetFiles(sRuta, "*.xml");
                        

                        //for (int i = 0; i < files.Length; ++i)
                        //{
                        //   int nlenfiles = files[i].Length;
                        //    ASPxListBoxXML.Items.Add((files[i].ToString().Substring(nLenRuta,nlenfiles - nLenRuta)));
                        //}

                        //XmlDocument doc = new XmlDocument();
                        //doc.Load("archivo.xml"); 
                        //Dim xDoc As XDocument = XDocument.Load(XMLfile)
                        //If IO.File.Exists(XMLfile) = True Then IO.File.Delete(XMLfile)

                    }
                    else
                    {

                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("An error occurred: '{0}'", ex);
                }
            }

        }

        protected void ASPxListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string sArchivoXML;
            XNamespace cfdi = "http://www.sat.gob.mx/cfd/3";
            XNamespace nomina = "http://www.sat.gob.mx/nomina12";
            try
            {
                int nLenRuta = (sRuta.Length + 1);
                for (int i = 0; i < files.Length; ++i)
                {
                    int nlenfiles = files[i].Length;
                    sArchivoXML = files[i].ToString().Substring(nLenRuta, nlenfiles - nLenRuta);

                    //Aqui Checo si el archivo ya exite en la tablas

                    if (ExiteArchivo(sArchivoXML))
                    {
                        continue;
                    }

                    // XML a String
                    String xmlText = File.ReadAllText(sRuta + "\\" + sArchivoXML);
                    var doc = XDocument.Parse(xmlText);
                    //Leer XML
                    var result = from XMLNomina in doc.Descendants(cfdi + "Comprobante")
                                 select new
                                 {
                                     nTotal = XMLNomina.Attribute("Total").Value,

                                     Emisor = new
                                     {
                                         cENombre = XMLNomina.Element(cfdi + "Emisor").Attribute("Nombre").Value,

                                     },
                                     Receptor = new
                                     {
                                         cRNombre = XMLNomina.Element(cfdi + "Receptor").Attribute("Nombre").Value,
                                     },

                                     nomina = new
                                     {
                                         FechaPago = XMLNomina.Element(cfdi + "Complemento").Element(nomina + "Nomina").Attribute("FechaPago").Value,
                                        NumDiasPag = XMLNomina.Element(cfdi + "Complemento").Element(nomina + "Nomina").Attribute("NumDiasPagados").Value,
                                         
                                     },

                                     nominaReceptor = new
                                     {
                                         cNumSS = XMLNomina.Element(cfdi + "Complemento").Element(nomina + "Nomina").Element(nomina + "Receptor").Attribute("NumSeguridadSocial").Value,  

                                     }
                                 };


                    foreach (var item in result)
                    {

                        string nump = item.nomina.NumDiasPag.ToString().TrimEnd(new Char[] { '0' });
                        nump = nump.TrimEnd(new Char[] { '.' });
                        int NumDiasPag = int.Parse(nump);

                        string ConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();

                        string SqlString = "Insert Into ArchivosXML (ArchivoXML, Total, EmisorNombre, ReceptorNombre, NumSeguridadSocial, FechaPago,NumDiasPagados) Values (@ArchivoXML, @Total, @EmisorNombre, @ReceptorNombre, @NumSeguridadSocial, @FechaPago,@NumDiasPagados)";

                        using (SqlConnection conn = new SqlConnection(ConnString))
                        {
                            using (SqlCommand cmd = new SqlCommand(SqlString, conn))
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("@ArchivoXML", sArchivoXML);
                                cmd.Parameters.AddWithValue("@Total", item.nTotal);
                                cmd.Parameters.AddWithValue("@EmisorNombre", item.Emisor.cENombre);
                                cmd.Parameters.AddWithValue("@ReceptorNombre", item.Receptor.cRNombre);
                                cmd.Parameters.AddWithValue("@FechaPago", item.nomina.FechaPago);
                                cmd.Parameters.Add("@NumDiasPagados", SqlDbType.Int);
                                cmd.Parameters["@NumDiasPagados"].Value = NumDiasPag; //val.Parse(item.nomina.NumDiasPag);
                                cmd.Parameters.AddWithValue("@NumSeguridadSocial", item.nominaReceptor.cNumSS);                                
                                conn.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
                //ASPxGridView1.DataSource = SDSourceAchivosXML; 
                ASPxGridView1.DataBind();
            }

            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: '{0}'", ex);
            }
        }


        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;

                cmd.CommandText = "delete  from ArchivosXML";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();

            }
            ASPxGridView1.DataBind();
        }
        public static bool ExiteArchivo(string sArchivoXMLB)
        {
            using (SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString()))
            {
                sqlConnection1.Open();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;

                //BUSCA EN ArchivosXML
                cmd.CommandText = "select ArchivoXML from ArchivosXML where ArchivoXML='" + sArchivoXMLB + "' ";
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlConnection1;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
        }
    }

  




}
 