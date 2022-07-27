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
    public partial class Home : System.Web.UI.Page
    {
        static String activationcode;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
        }
        protected void loginbtn_Click(object sender, EventArgs e)
        {
            // user login
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from normal where userid='" + userid.Text.Trim() + "' AND password='" + password.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["username"] = dr.GetValue(7).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Response.Redirect("Home Page.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                //signUpNewMember();
                if (txtname.Text != "" && txtgender.SelectedItem.Text != "Select" && txtdob.Text != "" && txtcontact.Text != "" && txtemail.Text != "" && listcity.SelectedItem.Text != "" && txtaddress.Text != "" && useridsignup.Text != "" && passwordsignup.Text != "")
                {
                    try
                    {
                            SqlConnection con = new SqlConnection(strcon);
                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            SqlCommand cmd = new SqlCommand("INSERT INTO normal(fullname,gender,age,contact,email,town,address,userid,password) values(@fullname,@gender,@age,@contact,@email,@town,@address,@userid,@password)", con);
                            cmd.Parameters.AddWithValue("@fullname", txtname.Text.Trim());
                            cmd.Parameters.AddWithValue("@gender", txtgender.Text.Trim());
                            cmd.Parameters.AddWithValue("@age", txtdob.Text.Trim());
                            cmd.Parameters.AddWithValue("@contact", txtcontact.Text.Trim());
                            cmd.Parameters.AddWithValue("@town", listcity.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                            cmd.Parameters.AddWithValue("@address", txtaddress.Text.Trim());
                            cmd.Parameters.AddWithValue("@userid", useridsignup.Text.Trim());
                            cmd.Parameters.AddWithValue("@password", passwordsignup.Text.Trim());
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script>alert('Sign Up Successful. Go to Login');</script>");
                            userid.Text = useridsignup.Text;
                        }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Fill-up all Text Field');</script>");
                }
            }
        }
        // user defined method
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from normal where userid='" + useridsignup.Text.Trim() + "';", con);
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

        protected void btnsend_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activationcode = random.Next(1000, 9999).ToString();
            if (txtemail.Text != "")
            {
                if (!checkMemberExistsEmail())
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
                    msg.Body = "Hello " + txtname.Text + " Your Activation Code is: <h3><b>" + activationcode + "</b></h3> Input in your verification Text field";
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
                    Response.Write("<script>alert('Your Email Address Already Exist on our System!');</script>");
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
                Response.Write("<script>alert('Verify Successfully');</script>");
                proceed.Visible = true;
                verify.Visible = false;
            }
            else
            {
                Response.Write("<script>alert('Wrong Code!');</script>");
            }

        }
        bool checkMemberExistsEmail()
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