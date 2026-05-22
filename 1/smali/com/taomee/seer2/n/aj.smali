.class public Lcom/taomee/seer2/n/aj;
.super Ljava/lang/Object;


# direct methods
.method protected static a(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;
    .locals 5

    const/16 v2, 0x7530

    const/16 v4, 0x50

    const/4 v0, 0x0

    invoke-static {p0}, Lcom/taomee/seer2/n/aj;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/taomee/seer2/n/aj;->b(Landroid/content/Context;)Z

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

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aM:Ljava/lang/String;

    invoke-direct {v0, v2, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aN:Ljava/lang/String;

    invoke-static {p0}, Lcom/taomee/seer2/n/aj;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v0, Lorg/apache/http/HttpHost;

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aO:Ljava/lang/String;

    invoke-direct {v0, v2, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    :cond_1
    invoke-static {v1, v0}, Lcom/taomee/seer2/n/aj;->a(Lorg/apache/http/params/HttpParams;Lorg/apache/http/HttpHost;)V

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    goto :goto_0

    :cond_2
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    goto :goto_0
.end method

.method protected static a(ILandroid/content/Context;Ljava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V
    .locals 4

    new-instance v0, Landroid/app/Notification;

    const-string v1, ""

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, p0, v1, v2, v3}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    const/4 v1, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p1, v1, p5, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    iput p4, v0, Landroid/app/Notification;->flags:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, -0x1

    if-le p7, v3, :cond_0

    const/16 v3, 0x64

    if-gt p7, v3, :cond_0

    invoke-virtual {v2, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "%    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, p2, v2, v1}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-static {p1}, Lcom/taomee/seer2/n/aj;->d(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v1

    const v2, 0x61a80

    add-int/2addr v2, p3

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method protected static a(Landroid/content/Context;Lcom/taomee/seer2/n/b/h;Lcom/taomee/seer2/n/b/c;)V
    .locals 3

    invoke-static {}, Lcom/taomee/seer2/n/b/d;->a()Lcom/taomee/seer2/n/b/d;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/taomee/seer2/n/b/d;->a(Landroid/content/Context;)Lcom/taomee/seer2/n/b/d;

    move-result-object v0

    :cond_0
    invoke-virtual {v0, p1}, Lcom/taomee/seer2/n/b/d;->a(Lcom/taomee/seer2/n/b/h;)Lcom/taomee/seer2/n/b/h;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/taomee/seer2/n/b/h;->g()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    invoke-virtual {v0}, Lcom/taomee/seer2/n/b/h;->g()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->n()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/n/b/h;->a(Ljava/lang/Object;)V

    invoke-virtual {v0, p2}, Lcom/taomee/seer2/n/b/h;->a(Lcom/taomee/seer2/n/b/c;)V

    if-eqz p2, :cond_1

    invoke-virtual {v0}, Lcom/taomee/seer2/n/b/h;->g()I

    move-result v1

    invoke-interface {p2, v0, v1}, Lcom/taomee/seer2/n/b/c;->a(Lcom/taomee/seer2/n/b/h;I)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p1, p2}, Lcom/taomee/seer2/n/b/h;->a(Lcom/taomee/seer2/n/b/c;)V

    :cond_3
    invoke-virtual {p1}, Lcom/taomee/seer2/n/b/h;->d()V

    goto :goto_0
.end method

.method protected static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static a(Lorg/apache/http/params/HttpParams;Lorg/apache/http/HttpHost;)V
    .locals 1

    const-string v0, "http.route.default-proxy"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method protected static b(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-static {p0}, Lcom/taomee/seer2/n/aj;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/taomee/seer2/n/d/b;->aQ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method protected static c(Landroid/content/Context;)Ljava/lang/String;
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

.method public static d(Landroid/content/Context;)Landroid/app/NotificationManager;
    .locals 1

    invoke-static {p0}, Lcom/taomee/seer2/n/aj;->e(Landroid/content/Context;)Landroid/app/NotificationManager;

    move-result-object v0

    return-object v0
.end method

.method public static e(Landroid/content/Context;)Landroid/app/NotificationManager;
    .locals 1

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    return-object v0
.end method
