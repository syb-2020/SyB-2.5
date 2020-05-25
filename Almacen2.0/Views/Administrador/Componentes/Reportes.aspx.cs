using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;
using System.IO;

namespace Almacen2._0.Views.Administrador.Componentes
{   
    public partial class Reportes : System.Web.UI.Page
    {
       

        

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/files"));
                FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);

                GridView1.DataSource = fileInfo;
                GridView1.DataBind();
            }

            UpdatePanel updatePanel = Page.Master.FindControl("UpdatePanel1") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btnSubirArchivo.UniqueID;
            updatePanel.Triggers.Add(trigger);
        }


        protected void btnSubirArchivo_Click(object sender, EventArgs e)
        {

            //HttpPostedFile myFile = Filex.PostedFile;
            //string fullPath = Server.MapPath("~/files/") + myFile.FileName;
            //myFile.SaveAs(fullPath);
            //if (this.FileUpload1.HasFile)
            //{
            //    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            //    string fullPath = Path.Combine(Server.MapPath("~/files"), FileUpload1.FileName);
            //    FileUpload1.SaveAs(fullPath);

            //    Response.Redirect("Reportes.aspx"); //se recarga la propia pagina
            //}

            if (FileUpload1.HasFile == false)
            {
                UploadDetails.Text = "Seleccione Archivo";
            }
            else
            {
                string FileName = FileUpload1.FileName;
                UploadDetails.Text = string.Format(
                        @"Uploaded file: {0}<br />
              File size (in bytes): {1:N0}<br />
              Content-type: {2}",
                          FileName,
                          FileUpload1.FileBytes.Length,
                          FileUpload1.PostedFile.ContentType);

                // Save the file
                string filePath = Server.MapPath("~/files/" + FileUpload1.FileName);
                FileUpload1.SaveAs(filePath);
                Response.Redirect("Reportes.aspx");
                UploadDetails.Text = "Archivo Subido";
            }



        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //se obtiene el nombre de campo definido en el DataKeyNames del gridview
            string fileName = Convert.ToString(GridView1.DataKeys[e.RowIndex].Value);
            //se define el path fisico del archivo
            string fullPath = Path.Combine(Server.MapPath("~/files"), fileName);

            File.Delete(fullPath);

            Response.Redirect("Reportes.aspx");
        }
    }
}