using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace newtest
{
    public partial class Forgot : System.Web.UI.Page
    {
        static String activationcode;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activationcode = random.Next(1000, 9999).ToString();
            if (txtemail.Text != "")
            {
                if (checkMemberExists())
                {
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential("resetagahanap@gmail.com", "Resetagahanap08");
                    smtp.EnableSsl = true;

                    MailMessage msg = new MailMessage();
                    msg.IsBodyHtml = true;
                    msg.Subject = "Activation Code to Verify Your Email";
                    msg.Body = "Hello! Here Your Activation Code: <h3><b>" + activationcode + "</b></h3> Input in your verification text field";
                    string toaddress = txtemail.Text;
                    msg.To.Add(toaddress);
                    string fromaddress = "ReseTagahanap: <resetagahanap@gmail.com>";
                    msg.From = new MailAddress(fromaddress);

                    try
                    {
                        smtp.Send(msg);
                        Response.Write("<script>alert('Check Your Email for your Verification Code!');</script>");
                        btnsend.Text = "Resend";
                        btnverify.Visible = true;
                    }
                    catch
                    {
                        throw;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Your Email Address Didnt Exist on our System!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Input Email for your Verification Code!');</script>");
            }
        }

        protected void btnverify_Click(object sender, EventArgs e)
        {
            if (activationcode == txtotp.Text)
            {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("select * from normal where email='" + txtemail.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["username"] = dr.GetValue(7).ToString();
                            Session["fullname"] = dr.GetValue(0).ToString();
                            Session["role"] = "user";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Verify Successfully. Proceed to your Profile');window.location='Profile.aspx';", true);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Something Wrong! Please Contact Developer Team');</script>");
                    }
            }
            else
            {
                Response.Write("<script>alert('Wrong Verification Code!');</script>");
            }
        }
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from normal where email='" + txtemail.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
    }
}