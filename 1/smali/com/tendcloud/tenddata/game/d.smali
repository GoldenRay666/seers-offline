.class final Lcom/tendcloud/tenddata/game/d;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    :try_start_0
    const-string v0, "gaandroid.talkingdata.net"

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/al;->b(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->b()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/al;->a(Lorg/apache/http/impl/client/DefaultHttpClient;)Lorg/apache/http/impl/client/DefaultHttpClient;

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x2

    :try_start_1
    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Resolve DNS :"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->b()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/al;->a(Lorg/apache/http/impl/client/DefaultHttpClient;)Lorg/apache/http/impl/client/DefaultHttpClient;

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->b()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v1

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/al;->a(Lorg/apache/http/impl/client/DefaultHttpClient;)Lorg/apache/http/impl/client/DefaultHttpClient;

    throw v0
.end method
