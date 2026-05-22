.class public Lcom/taomee/android/pay/HttpClient;
.super Ljava/lang/Object;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;,
        Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;,
        Lcom/taomee/android/pay/HttpClient$HttpRequestParams;,
        Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;,
        Lcom/taomee/android/pay/HttpClient$JsonHttpResponseHandler;
    }
.end annotation


# static fields
.field private static client:Lcom/loopj/android/http/AsyncHttpClient;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 43
    sput-object v1, Lcom/taomee/android/pay/HttpClient;->client:Lcom/loopj/android/http/AsyncHttpClient;

    .line 375
    sget-object v1, Lcom/taomee/android/pay/HttpClient;->client:Lcom/loopj/android/http/AsyncHttpClient;

    if-nez v1, :cond_0

    .line 376
    new-instance v1, Lcom/loopj/android/http/AsyncHttpClient;

    invoke-direct {v1}, Lcom/loopj/android/http/AsyncHttpClient;-><init>()V

    sput-object v1, Lcom/taomee/android/pay/HttpClient;->client:Lcom/loopj/android/http/AsyncHttpClient;

    .line 378
    :cond_0
    :try_start_0
    const-string v1, "TLS"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 379
    .local v0, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v1, 0x0

    const/4 v2, 0x1

    new-array v2, v2, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    new-instance v4, Lcom/taomee/android/pay/MyX509TrustManager;

    invoke-direct {v4}, Lcom/taomee/android/pay/MyX509TrustManager;-><init>()V

    aput-object v4, v2, v3

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 380
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-static {v1}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 381
    new-instance v1, Lcom/taomee/android/pay/MyHostnameVerifier;

    invoke-direct {v1}, Lcom/taomee/android/pay/MyHostnameVerifier;-><init>()V

    invoke-static {v1}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    return-void

    .line 382
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/String;Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "httpResponseHandler"    # Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;

    .prologue
    .line 47
    sget-object v0, Lcom/taomee/android/pay/HttpClient;->client:Lcom/loopj/android/http/AsyncHttpClient;

    invoke-virtual {v0, p0, p1}, Lcom/loopj/android/http/AsyncHttpClient;->get(Ljava/lang/String;Lcom/loopj/android/http/AsyncHttpResponseHandler;)V

    .line 48
    return-void
.end method

.method public static post(Ljava/lang/String;Lcom/taomee/android/pay/HttpClient$HttpRequestParams;Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "params"    # Lcom/taomee/android/pay/HttpClient$HttpRequestParams;
    .param p2, "httpResponseHandler"    # Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;

    .prologue
    .line 52
    sget-object v0, Lcom/taomee/android/pay/HttpClient;->client:Lcom/loopj/android/http/AsyncHttpClient;

    invoke-virtual {v0, p0, p1, p2}, Lcom/loopj/android/http/AsyncHttpClient;->post(Ljava/lang/String;Lcom/loopj/android/http/RequestParams;Lcom/loopj/android/http/AsyncHttpResponseHandler;)V

    .line 53
    return-void
.end method
