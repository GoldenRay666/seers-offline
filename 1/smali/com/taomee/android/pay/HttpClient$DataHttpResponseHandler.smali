.class public Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;
.super Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/android/pay/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataHttpResponseHandler"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 142
    invoke-direct {p0}, Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected handleFailureMessage(Ljava/lang/Throwable;[B)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "responseBody"    # [B

    .prologue
    .line 166
    invoke-virtual {p0, p1, p2}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->onFailure(Ljava/lang/Throwable;[B)V

    .line 167
    return-void
.end method

.method protected handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 173
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 183
    invoke-super {p0, p1}, Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;->handleMessage(Landroid/os/Message;)V

    .line 186
    :goto_0
    return-void

    .line 175
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 176
    .local v0, "response":[Ljava/lang/Object;
    aget-object v1, v0, v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v0, v3

    check-cast v1, [B

    invoke-virtual {p0, v2, v1}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->handleSuccessMessage(I[B)V

    goto :goto_0

    .line 179
    .end local v0    # "response":[Ljava/lang/Object;
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 180
    .restart local v0    # "response":[Ljava/lang/Object;
    aget-object v1, v0, v2

    check-cast v1, Ljava/lang/Throwable;

    aget-object v2, v0, v3

    check-cast v2, [B

    invoke-virtual {p0, v1, v2}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->handleFailureMessage(Ljava/lang/Throwable;[B)V

    goto :goto_0

    .line 173
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected handleSuccessMessage(I[B)V
    .locals 0
    .param p1, "statusCode"    # I
    .param p2, "responseBody"    # [B

    .prologue
    .line 162
    invoke-virtual {p0, p1, p2}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->onSuccess(I[B)V

    .line 163
    return-void
.end method

.method public onFailure(Ljava/lang/Throwable;[B)V
    .locals 0
    .param p1, "error"    # Ljava/lang/Throwable;
    .param p2, "binaryData"    # [B
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->onFailure(Ljava/lang/Throwable;)V

    .line 152
    return-void
.end method

.method public onSuccess(I[B)V
    .locals 0
    .param p1, "statusCode"    # I
    .param p2, "binaryData"    # [B

    .prologue
    .line 146
    invoke-virtual {p0, p2}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->onSuccess([B)V

    .line 147
    return-void
.end method

.method public onSuccess([B)V
    .locals 0
    .param p1, "binaryData"    # [B

    .prologue
    .line 144
    return-void
.end method

.method protected sendFailureMessage(Ljava/lang/Throwable;[B)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "responseBody"    # [B

    .prologue
    const/4 v2, 0x1

    .line 159
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    aput-object p2, v0, v2

    invoke-virtual {p0, v2, v0}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 160
    return-void
.end method

.method sendResponseMessage(Lorg/apache/http/HttpResponse;)V
    .locals 10
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v7, 0x0

    .line 188
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    .line 189
    .local v5, "status":Lorg/apache/http/StatusLine;
    const-string v8, "Content-Type"

    invoke-interface {p1, v8}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "contentTypeHeaders":[Lorg/apache/http/Header;
    move-object v4, v7

    .line 190
    check-cast v4, [B

    .line 191
    .local v4, "responseBody":[B
    array-length v8, v0

    const/4 v9, 0x1

    if-eq v8, v9, :cond_0

    .line 192
    new-instance v7, Lorg/apache/http/client/HttpResponseException;

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    const-string v9, "None, or more than one, Content-Type Header found!"

    invoke-direct {v7, v8, v9}, Lorg/apache/http/client/HttpResponseException;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v7, v4}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;[B)V

    .line 211
    :goto_0
    return-void

    .line 196
    :cond_0
    const/4 v2, 0x0

    .line 197
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    .line 198
    .local v6, "temp":Lorg/apache/http/HttpEntity;
    if-eqz v6, :cond_1

    .line 199
    new-instance v3, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v3, v6}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    .end local v2    # "entity":Lorg/apache/http/HttpEntity;
    .local v3, "entity":Lorg/apache/http/HttpEntity;
    move-object v2, v3

    .line 201
    .end local v3    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v2    # "entity":Lorg/apache/http/HttpEntity;
    :cond_1
    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 206
    .end local v6    # "temp":Lorg/apache/http/HttpEntity;
    :goto_1
    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0x12c

    if-lt v7, v8, :cond_2

    .line 207
    new-instance v7, Lorg/apache/http/client/HttpResponseException;

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/http/client/HttpResponseException;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v7, v4}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;[B)V

    goto :goto_0

    .line 202
    :catch_0
    move-exception v1

    .line 203
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {p0, v1, v7}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;[B)V

    goto :goto_1

    .line 209
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    invoke-virtual {p0, v7, v4}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->sendSuccessMessage(I[B)V

    goto :goto_0
.end method

.method protected sendSuccessMessage(I[B)V
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "responseBody"    # [B

    .prologue
    const/4 v2, 0x0

    .line 154
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-virtual {p0, v2, v0}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/taomee/android/pay/HttpClient$DataHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 155
    return-void
.end method
