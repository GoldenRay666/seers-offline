.class public final Lcom/tendcloud/tenddata/game/al;
.super Ljava/lang/Object;


# static fields
.field private static final a:Ljava/lang/String; = "/g/d?crc="

.field private static final b:Ljava/lang/String; = "gaandroid.talkingdata.net"

.field private static final c:Ljava/lang/String; = "http://"

.field private static final d:Ljava/lang/String; = "POST"

.field private static final e:I = 0xea60

.field private static final f:Ljava/util/zip/CRC32;

.field private static g:Ljava/lang/String;

.field private static h:Lorg/apache/http/impl/client/DefaultHttpClient;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v1, 0x0

    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    sput-object v0, Lcom/tendcloud/tenddata/game/al;->f:Ljava/util/zip/CRC32;

    sput-object v1, Lcom/tendcloud/tenddata/game/al;->g:Ljava/lang/String;

    sput-object v1, Lcom/tendcloud/tenddata/game/al;->h:Lorg/apache/http/impl/client/DefaultHttpClient;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lorg/apache/http/impl/client/DefaultHttpClient;)Lorg/apache/http/impl/client/DefaultHttpClient;
    .locals 0

    sput-object p0, Lcom/tendcloud/tenddata/game/al;->h:Lorg/apache/http/impl/client/DefaultHttpClient;

    return-object p0
.end method

.method public static a()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/tendcloud/tenddata/game/d;

    invoke-direct {v1}, Lcom/tendcloud/tenddata/game/d;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private static a(Lorg/apache/http/client/methods/HttpUriRequest;)V
    .locals 0

    return-void
.end method

.method static a(Ljava/lang/String;)Z
    .locals 3

    const-string v0, "/g/d?crc="

    const-string v1, "POST"

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/al;->c(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/tendcloud/tenddata/game/al;->a(Ljava/lang/String;Ljava/lang/String;[B)Z

    move-result v0

    return v0
.end method

.method private static declared-synchronized a(Ljava/lang/String;Ljava/lang/String;[B)Z
    .locals 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-class v3, Lcom/tendcloud/tenddata/game/al;

    monitor-enter v3

    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "Send data to server."

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/at;->b([Ljava/lang/String;)V

    sget-object v2, Lcom/tendcloud/tenddata/game/al;->f:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->reset()V

    sget-object v2, Lcom/tendcloud/tenddata/game/al;->f:Ljava/util/zip/CRC32;

    invoke-virtual {v2, p2}, Ljava/util/zip/CRC32;->update([B)V

    sget-object v2, Lcom/tendcloud/tenddata/game/al;->h:Lorg/apache/http/impl/client/DefaultHttpClient;

    if-nez v2, :cond_0

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->c()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v2

    sput-object v2, Lcom/tendcloud/tenddata/game/al;->h:Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "http://"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v2, Lcom/tendcloud/tenddata/game/al;->g:Ljava/lang/String;

    if-nez v2, :cond_2

    const-string v2, "gaandroid.talkingdata.net"

    :goto_0
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/tendcloud/tenddata/game/al;->f:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    const-string v5, "POST"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    new-instance v4, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v4, p2}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Lorg/apache/http/entity/ByteArrayEntity;->setContentEncoding(Ljava/lang/String;)V

    const-string v5, "application/json"

    invoke-virtual {v4, v5}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    :cond_1
    invoke-static {v2}, Lcom/tendcloud/tenddata/game/al;->a(Lorg/apache/http/client/methods/HttpUriRequest;)V

    sget-object v4, Lcom/tendcloud/tenddata/game/al;->h:Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v4, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Post data operation response status code: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v4}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v4, 0xc8

    if-ne v2, v4, :cond_3

    :goto_1
    monitor-exit v3

    return v0

    :cond_2
    :try_start_2
    sget-object v2, Lcom/tendcloud/tenddata/game/al;->g:Ljava/lang/String;
    :try_end_2
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_3
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V

    :goto_2
    move v0, v1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :catch_2
    move-exception v0

    :try_start_4
    invoke-virtual {v0}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_2

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2
.end method

.method static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    sput-object p0, Lcom/tendcloud/tenddata/game/al;->g:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic b()Lorg/apache/http/impl/client/DefaultHttpClient;
    .locals 1

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->c()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v0

    return-object v0
.end method

.method private static c()Lorg/apache/http/impl/client/DefaultHttpClient;
    .locals 8

    const v2, 0x2bf20

    const v1, 0xea60

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/b;->c(Landroid/content/Context;)Z

    move-result v3

    new-instance v4, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    new-instance v0, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v6

    const/16 v7, 0x50

    invoke-direct {v0, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v4, v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    new-instance v0, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v6

    const/16 v7, 0x1bb

    invoke-direct {v0, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v4, v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    new-instance v5, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v5}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    if-eqz v3, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v5, v0}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    if-eqz v3, :cond_2

    :goto_1
    invoke-static {v5, v1}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    const/4 v0, 0x1

    invoke-static {v5, v0}, Lorg/apache/http/params/HttpConnectionParams;->setTcpNoDelay(Lorg/apache/http/params/HttpParams;Z)V

    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v5, v4}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v0, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    if-nez v3, :cond_0

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->e()Lorg/apache/http/HttpHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const-string v3, "http.route.default-proxy"

    invoke-interface {v2, v3, v0}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    :cond_0
    new-instance v0, Lcom/tendcloud/tenddata/game/g;

    invoke-direct {v0}, Lcom/tendcloud/tenddata/game/g;-><init>()V

    invoke-virtual {v1, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->addRequestInterceptor(Lorg/apache/http/HttpRequestInterceptor;)V

    return-object v1

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method

.method private static c(Ljava/lang/String;)[B
    .locals 4

    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v2, 0x0

    :try_start_0
    new-instance v1, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v1, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/zip/GZIPOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_0
    :goto_0
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v1, v2

    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_0

    :try_start_4
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_3
    move-exception v0

    move-object v1, v2

    :goto_2
    :try_start_5
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v1, :cond_0

    :try_start_6
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_0

    :catch_4
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v2

    :goto_3
    if-eqz v1, :cond_1

    :try_start_7
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    :cond_1
    :goto_4
    throw v0

    :catch_5
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_3

    :catch_6
    move-exception v0

    goto :goto_2

    :catch_7
    move-exception v0

    goto :goto_1
.end method

.method private static d()Z
    .locals 1

    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static e()Lorg/apache/http/HttpHost;
    .locals 3

    new-instance v0, Lorg/apache/http/HttpHost;

    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method
