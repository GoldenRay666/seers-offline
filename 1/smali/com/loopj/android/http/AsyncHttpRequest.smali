.class Lcom/loopj/android/http/AsyncHttpRequest;
.super Ljava/lang/Object;
.source "AsyncHttpRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final client:Lorg/apache/http/impl/client/AbstractHttpClient;

.field private final context:Lorg/apache/http/protocol/HttpContext;

.field private executionCount:I

.field private isBinaryRequest:Z

.field private final request:Lorg/apache/http/client/methods/HttpUriRequest;

.field private final responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/client/AbstractHttpClient;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/loopj/android/http/AsyncHttpResponseHandler;)V
    .locals 1
    .param p1, "client"    # Lorg/apache/http/impl/client/AbstractHttpClient;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p4, "responseHandler"    # Lcom/loopj/android/http/AsyncHttpResponseHandler;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->client:Lorg/apache/http/impl/client/AbstractHttpClient;

    .line 43
    iput-object p2, p0, Lcom/loopj/android/http/AsyncHttpRequest;->context:Lorg/apache/http/protocol/HttpContext;

    .line 44
    iput-object p3, p0, Lcom/loopj/android/http/AsyncHttpRequest;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 45
    iput-object p4, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    .line 46
    instance-of v0, p4, Lcom/loopj/android/http/BinaryHttpResponseHandler;

    if-eqz v0, :cond_0

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/loopj/android/http/AsyncHttpRequest;->isBinaryRequest:Z

    .line 49
    :cond_0
    return-void
.end method

.method private makeRequest()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_0

    .line 77
    iget-object v2, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v2, :cond_0

    .line 78
    const/16 v0, 0xc8          # 200

    const/4 v1, 0x0

    const-string v3, ""

    invoke-virtual {v2, v0, v1, v3}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendSuccessMessage(I[Lorg/apache/http/Header;Ljava/lang/String;)V

    .line 80
    :cond_0
    return-void
.end method

.method private makeRequestWithRetries()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ConnectException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v3, 0x1

    .line 98
    .local v3, "retry":Z
    const/4 v0, 0x0

    .line 99
    .local v0, "cause":Ljava/io/IOException;
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->client:Lorg/apache/http/impl/client/AbstractHttpClient;

    invoke-virtual {v5}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;

    move-result-object v4

    .line 100
    .local v4, "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    :goto_0
    if-nez v3, :cond_0

    .line 133
    new-instance v2, Ljava/net/ConnectException;

    invoke-direct {v2}, Ljava/net/ConnectException;-><init>()V

    .line 134
    .local v2, "ex":Ljava/net/ConnectException;
    invoke-virtual {v2, v0}, Ljava/net/ConnectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 135
    throw v2

    .line 102
    .end local v2    # "ex":Ljava/net/ConnectException;
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpRequest;->makeRequest()V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_4

    .line 119
    :cond_1
    :goto_1
    return-void

    .line 104
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Ljava/net/UnknownHostException;
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v5, :cond_1

    .line 106
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    const-string v6, "can\'t resolve host"

    invoke-virtual {v5, v1, v6}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1

    .line 109
    .end local v1    # "e":Ljava/net/UnknownHostException;
    :catch_1
    move-exception v1

    .line 111
    .local v1, "e":Ljava/net/SocketException;
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v5, :cond_1

    .line 112
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    const-string v6, "can\'t resolve host"

    invoke-virtual {v5, v1, v6}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1

    .line 115
    .end local v1    # "e":Ljava/net/SocketException;
    :catch_2
    move-exception v1

    .line 116
    .local v1, "e":Ljava/net/SocketTimeoutException;
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v5, :cond_1

    .line 117
    iget-object v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    const-string v6, "socket time out"

    invoke-virtual {v5, v1, v6}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1

    .line 120
    .end local v1    # "e":Ljava/net/SocketTimeoutException;
    :catch_3
    move-exception v1

    .line 121
    .local v1, "e":Ljava/io/IOException;
    move-object v0, v1

    .line 122
    iget v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->executionCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->executionCount:I

    iget-object v6, p0, Lcom/loopj/android/http/AsyncHttpRequest;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v4, v0, v5, v6}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    goto :goto_0

    .line 123
    .end local v1    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v1

    .line 127
    .local v1, "e":Ljava/lang/NullPointerException;
    new-instance v0, Ljava/io/IOException;

    .end local v0    # "cause":Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "NPE in HttpClient"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 128
    .restart local v0    # "cause":Ljava/io/IOException;
    iget v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->executionCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/loopj/android/http/AsyncHttpRequest;->executionCount:I

    iget-object v6, p0, Lcom/loopj/android/http/AsyncHttpRequest;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v4, v0, v5, v6}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 54
    :try_start_0
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    invoke-virtual {v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendStartMessage()V

    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpRequest;->makeRequestWithRetries()V

    .line 60
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v1, :cond_1

    .line 61
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    invoke-virtual {v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFinishMessage()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    :cond_1
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    if-eqz v1, :cond_1

    .line 65
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    invoke-virtual {v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFinishMessage()V

    .line 66
    iget-boolean v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->isBinaryRequest:Z

    if-eqz v1, :cond_2

    .line 67
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    invoke-virtual {v1, v0, v2}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;[B)V

    goto :goto_0

    .line 69
    :cond_2
    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpRequest;->responseHandler:Lcom/loopj/android/http/AsyncHttpResponseHandler;

    invoke-virtual {v1, v0, v2}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_0
.end method
