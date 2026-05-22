.class public Lcom/taomee/seer2/a/a/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Lorg/apache/http/client/methods/HttpPost;

.field private b:[B

.field private c:Lcom/taomee/seer2/a/a/b;


# direct methods
.method public constructor <init>(Ljava/net/URI;[B)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/taomee/seer2/a/a/a;->b:[B

    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V

    iput-object v0, p0, Lcom/taomee/seer2/a/a/a;->a:Lorg/apache/http/client/methods/HttpPost;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public a(Lcom/taomee/seer2/a/a/b;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    return-void
.end method

.method public run()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    :try_start_0
    new-instance v0, Lorg/apache/http/entity/StringEntity;

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/taomee/seer2/a/a/a;->b:[B

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v0, v1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->a:Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v1, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const/16 v2, 0x2710

    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->a:Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v0

    array-length v1, v0

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v0}, Lcom/taomee/seer2/a/a/b;->a([B)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V
    :try_end_0
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v3, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0

    :catch_1
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v4, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0

    :catch_2
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v4, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0

    :catch_3
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v3, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0

    :catch_4
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v3, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0

    :catch_5
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v5, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0

    :catch_6
    move-exception v0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a/a;->c:Lcom/taomee/seer2/a/a/b;

    invoke-interface {v1, v5, v0}, Lcom/taomee/seer2/a/a/b;->a(ILjava/lang/Exception;)V

    goto :goto_0
.end method
