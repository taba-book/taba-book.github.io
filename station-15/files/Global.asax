<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

        Application["visits"] = 0;   // מונה ביקורים באתר: כמה כניסות היו
        Application["online"] = 0;   // כמה גולשים נמצאים באתר כרגע
       
    }
    void Session_Start(object sender, EventArgs e)
    {
        Session["uName"] = "אורח";
        Session["userFName"] = "אורח";
        Session["admin"] = "no";

        // --- ספירת כניסות וגולשים ---
        Application.Lock();

        int visits = (int)Application["visits"];
        Application["visits"] = visits + 1;

        int online = (int)Application["online"];
        Application["online"] = online + 1;

        Application.UnLock();
    }
    void Session_End(object sender, EventArgs e)
    {
        Application.Lock();

        int online = (int)Application["online"];
        Application["online"] = online - 1;

        Application.UnLock();
    }

</script>
