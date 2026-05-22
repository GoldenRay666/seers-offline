.class public Le22/c55/s88/e/g;
.super Ljava/lang/Object;


# direct methods
.method public static a(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;
    .locals 5

    const/16 v2, 0x7530

    const/16 v4, 0x50

    const/4 v0, 0x0

    invoke-static {p0}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Le22/c55/s88/e/g;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v1, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v1}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    const v0, 0x32000

    invoke-static {v1, v0}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    const/4 v0, 0x1

    invoke-static {v1, v0}, Lorg/apache/http/client/params/HttpClientParams;->setRedirecting(Lorg/apache/http/params/HttpParams;Z)V

    new-instance v0, Lorg/apache/http/HttpHost;

    sget-object v2, Le22/c55/s88/f/e;->bG:Ljava/lang/String;

    invoke-direct {v0, v2, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    sget-object v2, Le22/c55/s88/f/e;->bF:Ljava/lang/String;

    invoke-static {p0}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v0, Lorg/apache/http/HttpHost;

    sget-object v2, Le22/c55/s88/f/e;->bH:Ljava/lang/String;

    invoke-direct {v0, v2, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    :cond_1
    const-string v2, "http.route.default-proxy"

    invoke-interface {v1, v2, v0}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    goto :goto_0

    :cond_2
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V
    .locals 4

    new-instance v1, Landroid/app/Notification;

    const-string v0, ""

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, p1, v0, v2, v3}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    const/4 v0, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p0, v0, p5, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    sget v2, Le22/c55/s88/f/a;->a:I

    if-eq p4, v2, :cond_0

    iput p4, v1, Landroid/app/Notification;->flags:I

    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v3, -0x1

    if-le p7, v3, :cond_1

    const/16 v3, 0x64

    if-gt p7, v3, :cond_1

    invoke-virtual {v2, p7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v3, "%    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_1
    invoke-virtual {v2, p6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, p2, v2, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const v2, 0x61a80

    add-int/2addr v2, p3

    invoke-virtual {v0, v2, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V
    .locals 3

    invoke-static {}, Le22/c55/s88/b/b;->a()Le22/c55/s88/b/b;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {p0}, Le22/c55/s88/b/b;->a(Landroid/content/Context;)Le22/c55/s88/b/b;

    move-result-object v0

    :cond_0
    invoke-virtual {v0, p1}, Le22/c55/s88/b/b;->b(Le22/c55/s88/b/f;)Le22/c55/s88/b/f;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Le22/c55/s88/b/f;->i()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    invoke-virtual {v0}, Le22/c55/s88/b/f;->i()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    invoke-virtual {p1}, Le22/c55/s88/b/f;->p()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    invoke-virtual {v0, p2}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    if-eqz p2, :cond_1

    invoke-virtual {v0}, Le22/c55/s88/b/f;->i()I

    move-result v1

    invoke-interface {p2, v0, v1}, Le22/c55/s88/b/a;->a(Le22/c55/s88/b/f;I)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p1, p2}, Le22/c55/s88/b/f;->a(Le22/c55/s88/b/a;)V

    :cond_3
    invoke-virtual {p1}, Le22/c55/s88/b/f;->e()V

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method protected static b(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-static {p0}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    sget-object v2, Le22/c55/s88/f/e;->bC:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "3gwap"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Le22/c55/s88/f/e;->bD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public static c(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static d(Landroid/content/Context;)Z
    .locals 2

    if-eqz p0, :cond_0

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
