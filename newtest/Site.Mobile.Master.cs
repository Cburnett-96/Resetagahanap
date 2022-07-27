using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newtest
{
    public partial class Site_Mobile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Application["TotalOnlineUsers"].ToString();
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Linkbtnhome.Visible = false;
                Linkbtnhomedoctor.Visible = false;
                Linkbtnhomepharmacy.Visible = false;
                Linkbtnhomeadmin.Visible = false;
                imgbtnprofile.Visible = false;
                imgbtnprofiledoctor.Visible = false;
                imgbtnprofilepharmacy.Visible = false;
            }
            else if (Session["role"].Equals("user"))
            {
                Linkbtnhome.Visible = true;
                imgbtnprofile.Visible = true;
                Label1.Text = "Hello " + (string)Session["fullname"];
                Linklogin.Visible = false;
                Linksignup.Visible = false;
            }
            else if (Session["role"].Equals("doctor"))
            {
                Linkbtnhomedoctor.Visible = true;
                imgbtnprofiledoctor.Visible = true;
                Label1.Text = "Dr. " + (string)Session["fullname"];
                Linklogin.Visible = false;
                Linksignup.Visible = false;
            }
            else if (Session["role"].Equals("pharmacy"))
            {
                Linkbtnhomepharmacy.Visible = true;
                imgbtnprofilepharmacy.Visible = true;
                Label1.Text = (string)Session["fullname"];
                Linklogin.Visible = false;
                Linksignup.Visible = false;
            }
            else if (Session["role"].Equals("admin"))
            {
                Linklogin.Visible = false;
                Linksignup.Visible = false;
                Linkbtnhomeadmin.Visible = true;
            }
        }
        protected void imgbtnprofile_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void imgbtnprofiledoctor_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ProfileDoctor.aspx");
        }

        protected void imgbtnprofilepharmacy_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ProfilePharmacy.aspx");
        }
    }
}