using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Almacen2._0.Views.Administrador
{
    public partial class Administrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

           
        }
        //PostBackTrigger TriggerImgActualizar = new PostBackTrigger();
        //TriggerImgActualizar.ControlID = "ctl00$ContentPlaceHolder$FileUpload1";
        //if (HttpContext.Current.Request.Url.LocalPath == "/Paneldecontrol.aspx")
        //{
        //    UpdatePanel1.Triggers.Add(TriggerImgActualizar);
        //}
        //else
        //{
        //    UpdatePanel1.Triggers.Remove(TriggerImgActualizar);
        //}

    }
    }
