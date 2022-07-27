using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newtest
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Application["TotalOnlineUsers"].ToString();
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                //Linkbtnhome.Visible = false;
                Linkbtnhomedoctor.Visible = false;
                Linkbtnhomepharmacy.Visible = false;
                Linkbtnhomeadmin.Visible = false;
                Linkbtnhome.Visible = false;
                Linkbtnprofile.Visible = false;
                Linkbtnprofiledoctor.Visible = false;
                Linkbtnprofilepharmacy.Visible = false;
                Linkbtnlogout.Visible = false;
                hide.Visible = false;
                LoginSignup.Visible = true;
            }
            else if (Session["role"].Equals("user"))
            {
                Linkbtnhome.Visible = true;
                Linkbtnprofile.Visible = true;
                Label1.Text = "Hello " + (string)Session["fullname"];
                Linkbtnlogout.Visible = true;
                hide.Visible = true;
                LoginSignup.Visible = false;
            }
            else if (Session["role"].Equals("doctor"))
            {
                Linkbtnhome.Visible = false;
                Linkbtnhomedoctor.Visible = true;
                Linkbtnprofiledoctor.Visible = true;
                Label1.Text = (string)Session["fullname"];
                Linkbtnlogout.Visible = true;
                hide.Visible = true;
                LoginSignup.Visible = false;
            }
            else if (Session["role"].Equals("pharmacy"))
            {
                Linkbtnhome.Visible = false;
                Linkbtnhomepharmacy.Visible = true;
                Linkbtnprofilepharmacy.Visible = true;
                Label1.Text= (string)Session["fullname"];
                Linkbtnlogout.Visible = true;
                hide.Visible = true;
                LoginSignup.Visible = false;
            }
            else if (Session["role"].Equals("admin"))
            {
                Linkbtnhome.Visible = false;
                Linkbtnhomeadmin.Visible = true;
                hide.Visible = false;
                LoginSignup.Visible = false;
            }
        }
        protected void Linkbtnprofiledoctor_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileDoctor.aspx");
        }

        protected void Linkbtnprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void Linkbtnprofilepharmacy_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfilePharmacy.aspx");
        }

        protected void Linkbtnlogout_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString() == "doctor")
            {
                Session["role"] = null;
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("DoctorLoginSignup.aspx");
            }
            else if (Session["role"].ToString() == "pharmacy")
            {
                Session["role"] = null;
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("PharmacyLoginSignup.aspx");
            }
            else
            {
                Session["role"] = null;
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("LoginSignup.aspx");
            }
        }
    }
}