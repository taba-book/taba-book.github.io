<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

        Application["visits"] = 0;   // מונה ביקורים באתר: כמה כניסות היו
        Application["online"] = 0;   // כמה גולשים נמצאים באתר כרגע
       
        Application["q1"] = 0;       // מונה הצבעות לתשובות א-ד
        Application["q2"] = 0;
        Application["q3"] = 0;
        Application["q4"] = 0;
    }
    void Session_Start(object sender, EventArgs e)
    {
        Session["uName"] = "אורח";
        Session["userFName"] = "אורח";
        Session["voted"] = false;
        Session["myAnswer"] = "";
        Session["admin"] = "no";
        Session["homeMsg"] = "";

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
