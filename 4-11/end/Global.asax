<%@ Application Language="C#" %>

<script runat="server">

void Application_Start(object sender, EventArgs e)
{
    // רץ פעם אחת בלבד, כשהאתר עולה לאוויר
    Application["visits"] = 0;
    Application["online"] = 0;
}

void Session_Start(object sender, EventArgs e)
{
    // רץ פעם אחת, כשגולש חדש נכנס לאתר
    Session["user"] = "אורח";

    Application.Lock();

    int visits = (int)Application["visits"];
    Application["visits"] = visits + 1;

    int online = (int)Application["online"];
    Application["online"] = online + 1;

    Application.UnLock();
}

void Session_End(object sender, EventArgs e)
{
    // רץ כשה-Session מסתיים, למשל אחרי 20 דקות של חוסר פעילות
    Application.Lock();

    int online = (int)Application["online"];
    Application["online"] = online - 1;

    Application.UnLock();
}

</script>
