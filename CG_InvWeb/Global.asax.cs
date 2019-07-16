using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Security;
    using System.Web.SessionState;
    using DevExpress.Web;

    namespace CG_InvWeb {

        public class Global_asax : System.Web.HttpApplication {

            void Application_Start(object sender, EventArgs e) {
                DevExpress.Web.ASPxWebControl.CallbackError += new EventHandler(Application_Error);
            }

            void Application_End(object sender, EventArgs e) {
                // Code that runs on application shutdown
            }

            void Application_Error(object sender, EventArgs e) {
            var usuarios = System.Web.HttpContext.Current.Session["Usuario"];

            Exception exception = Server.GetLastError();
            Response.Clear();

            HttpException httpException = exception as HttpException;

            if (httpException != null)
            {
                string ultimoError = exception.Message;
                GlobalHandler obje = new GlobalHandler();
                obje.guardarLog(ultimoError);
            }
        }

            void Session_Start(object sender, EventArgs e) {
            // Code that runs when a new session is started
            //string usuario = System.Web.HttpContext.Current.Session["Usuario"].ToString();
        }

            void Session_End(object sender, EventArgs e) {
                // Code that runs when a session ends.
                // Note: The Session_End event is raised only when the sessionstate mode
                // is set to InProc in the Web.config file. If session mode is set to StateServer
                // or SQLServer, the event is not raised.
            }
        }
    }
