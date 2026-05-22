.class public Lcom/taomee/seer2/a/a/c;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static p:Ljava/util/ArrayList;


# instance fields
.field private a:Lorg/apache/http/HttpResponse;

.field private b:Ljava/net/URI;

.field private c:Ljava/lang/Thread;

.field private d:Ljava/io/InputStream;

.field private e:Lorg/apache/http/client/methods/HttpGet;

.field private f:J

.field private g:J

.field private h:Lorg/apache/http/StatusLine;

.field private i:Z

.field private j:Lorg/apache/http/util/ByteArrayBuffer;

.field private k:I

.field private l:I

.field private m:Landroid/os/Handler;

.field private n:Ljava/lang/Object;

.field private o:Ljava/lang/String;

.field private q:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/taomee/seer2/a/a/c;->p:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v1, p0, Lcom/taomee/seer2/a/a/c;->i:Z

    iput v1, p0, Lcom/taomee/seer2/a/a/c;->k:I

    iput v1, p0, Lcom/taomee/seer2/a/a/c;->l:I

    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->b:Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iput v1, p0, Lcom/taomee/seer2/a/a/c;->l:I

    iput v1, p0, Lcom/taomee/seer2/a/a/c;->k:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->n:Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static c(Ljava/lang/String;)Z
    .locals 2

    sget-object v0, Lcom/taomee/seer2/a/a/c;->p:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private e()Z
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->n:Ljava/lang/Object;

    monitor-enter v2
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    :try_start_1
    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->b:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/taomee/seer2/a/a/c;->c(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v2

    :goto_0
    return v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->q:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Lcom/taomee/seer2/a/d/b;->I:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/taomee/seer2/a/a/c;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/taomee/seer2/a/d/b;->I:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    iget v1, p0, Lcom/taomee/seer2/a/a/c;->k:I

    int-to-long v5, v1

    cmp-long v1, v5, v3

    if-eqz v1, :cond_1

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    :catch_0
    move-exception v1

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto :goto_0

    :cond_1
    :try_start_3
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->b:Ljava/net/URI;

    invoke-direct {v1, v3}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    iput-object v1, p0, Lcom/taomee/seer2/a/a/c;->e:Lorg/apache/http/client/methods/HttpGet;

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->e:Lorg/apache/http/client/methods/HttpGet;

    sget-object v3, Lcom/taomee/seer2/a/d/b;->aa:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bytes="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/taomee/seer2/a/a/c;->k:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->e:Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {v1}, Lorg/apache/http/client/methods/HttpGet;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const/16 v3, 0x2710

    invoke-static {v1, v3}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->e:Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {v1, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    iput-object v1, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Lcom/taomee/seer2/a/a/c;->d:Ljava/io/InputStream;

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/taomee/seer2/a/a/c;->f:J

    iget-wide v3, p0, Lcom/taomee/seer2/a/a/c;->f:J

    iget v1, p0, Lcom/taomee/seer2/a/a/c;->k:I

    int-to-long v5, v1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/taomee/seer2/a/a/c;->g:J

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    iput-object v1, p0, Lcom/taomee/seer2/a/a/c;->h:Lorg/apache/http/StatusLine;

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    const/4 v3, 0x0

    iput v3, v1, Landroid/os/Message;->what:I

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    iput-object v3, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    sget-object v1, Lcom/taomee/seer2/a/a/c;->p:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->b:Ljava/net/URI;

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v0, 0x1

    goto/16 :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :catch_2
    move-exception v1

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :catch_3
    move-exception v1

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :catch_4
    move-exception v1

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :catch_5
    move-exception v1

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0
.end method


# virtual methods
.method public a()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/taomee/seer2/a/a/c;->i:Z

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->c:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->c:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public a(I)V
    .locals 1

    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    invoke-direct {v0, p1}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    return-void
.end method

.method public a(Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    return-void
.end method

.method public b()V
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/a/c;->q:Ljava/lang/String;

    return-void
.end method

.method public c()V
    .locals 2

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->d()V

    iget v0, p0, Lcom/taomee/seer2/a/a/c;->l:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    const-wide/16 v0, 0x1388

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->a()V

    iget v0, p0, Lcom/taomee/seer2/a/a/c;->l:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/taomee/seer2/a/a/c;->l:I

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    iget v1, p0, Lcom/taomee/seer2/a/a/c;->k:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public d()V
    .locals 3

    :try_start_0
    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->n:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->c:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/taomee/seer2/a/a/c;->i:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->c:Ljava/lang/Thread;

    :cond_0
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->d:Ljava/io/InputStream;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->d:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->d:Ljava/io/InputStream;

    :cond_1
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->h:Lorg/apache/http/StatusLine;

    :cond_2
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->e:Lorg/apache/http/client/methods/HttpGet;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->e:Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    :cond_3
    sget-object v0, Lcom/taomee/seer2/a/a/c;->p:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->b:Ljava/net/URI;

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v1

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public run()V
    .locals 9

    invoke-direct {p0}, Lcom/taomee/seer2/a/a/c;->e()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v2, 0x3

    iput v2, v0, Landroid/os/Message;->what:I

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->h:Lorg/apache/http/StatusLine;

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    iput v2, v0, Landroid/os/Message;->arg1:I

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_2
    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    :cond_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->yield()V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    :cond_4
    :goto_1
    iget-boolean v0, p0, Lcom/taomee/seer2/a/a/c;->i:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->a:Lorg/apache/http/HttpResponse;

    if-eqz v0, :cond_4

    :try_start_2
    iget-object v1, p0, Lcom/taomee/seer2/a/a/c;->n:Ljava/lang/Object;

    monitor-enter v1
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6

    :try_start_3
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    if-nez v0, :cond_5

    iget-wide v2, p0, Lcom/taomee/seer2/a/a/c;->f:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_5

    iget-wide v2, p0, Lcom/taomee/seer2/a/a/c;->f:J

    long-to-int v0, v2

    invoke-virtual {p0, v0}, Lcom/taomee/seer2/a/a/c;->a(I)V

    :cond_5
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->h:Lorg/apache/http/StatusLine;

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v2, 0xc8

    if-eq v0, v2, :cond_6

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->h:Lorg/apache/http/StatusLine;

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v2, 0xce

    if-ne v0, v2, :cond_1

    :cond_6
    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->d:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v3}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v3

    iget-object v4, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v4

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    iget v2, p0, Lcom/taomee/seer2/a/a/c;->k:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/taomee/seer2/a/a/c;->k:I

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v3}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {v2, v3}, Lorg/apache/http/util/ByteArrayBuffer;->setLength(I)V

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v2

    const/4 v3, 0x1

    iput v3, v2, Landroid/os/Message;->what:I

    iget v3, p0, Lcom/taomee/seer2/a/a/c;->k:I

    int-to-long v3, v3

    iget-wide v5, p0, Lcom/taomee/seer2/a/a/c;->g:J

    const-wide/16 v7, 0x64

    div-long/2addr v5, v7

    div-long/2addr v3, v5

    long-to-int v3, v3

    iput v3, v2, Landroid/os/Message;->arg1:I

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    iput-object v3, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v3, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_7
    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->isFull()Z

    move-result v2

    if-eqz v2, :cond_b

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->q:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/taomee/seer2/a/d/b;->I:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->j:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lcom/taomee/seer2/a/d/d;->b(Ljava/lang/String;[BZ)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/taomee/seer2/a/a/c;->g:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_9

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/taomee/seer2/a/a/c;->k:I

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v2, 0x5

    iput v2, v0, Landroid/os/Message;->what:I

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_8
    monitor-exit v1

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :cond_9
    :try_start_5
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/taomee/seer2/a/a/c;->q:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->b()V

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->d()V

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v2, 0x2

    iput v2, v0, Landroid/os/Message;->what:I

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/taomee/seer2/a/a/c;->q:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/taomee/seer2/a/a/c;->o:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    iput-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v2, p0, Lcom/taomee/seer2/a/a/c;->m:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_a
    monitor-exit v1

    goto/16 :goto_0

    :cond_b
    const/4 v2, -0x1

    if-ne v0, v2, :cond_3

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :catch_2
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_0

    :catch_3
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_1

    :catch_4
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_1

    :catch_5
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_1

    :catch_6
    move-exception v0

    invoke-virtual {p0}, Lcom/taomee/seer2/a/a/c;->c()V

    goto/16 :goto_1
.end method
