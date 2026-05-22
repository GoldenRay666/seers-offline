.class abstract Lcom/tendcloud/appcpa/d;
.super Lcom/tendcloud/appcpa/a;


# instance fields
.field private b:Ljava/lang/String;

.field final synthetic c:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method public constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/d;->c:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1}, Lcom/tendcloud/appcpa/a;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    iput-object p2, p0, Lcom/tendcloud/appcpa/d;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    iget-object v0, p0, Lcom/tendcloud/appcpa/d;->c:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/a/a/a/d;->b(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v2, p0, Lcom/tendcloud/appcpa/d;->b:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const-string v2, "appcpa"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "appcpa"

    iget-object v3, p0, Lcom/tendcloud/appcpa/d;->b:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/tendcloud/appcpa/d;->b()V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v1

    :goto_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_2
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    :catchall_0
    move-exception v0

    :goto_3
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    :catchall_1
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_3

    :catch_2
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method public abstract b()V
.end method
