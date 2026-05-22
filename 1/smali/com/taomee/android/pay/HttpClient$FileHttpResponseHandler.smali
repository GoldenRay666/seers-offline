.class public Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;
.super Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/android/pay/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileHttpResponseHandler"
.end annotation


# static fields
.field protected static final PROGRESS_MESSAGE:I = 0x4


# instance fields
.field protected append:Z

.field protected cancel:Z

.field private current:J

.field private file:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 224
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;-><init>(Ljava/lang/String;Z)V

    .line 225
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "deleteIfExist"    # Z

    .prologue
    const/4 v2, 0x0

    .line 227
    invoke-direct {p0}, Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;-><init>()V

    .line 218
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    .line 219
    iput-boolean v2, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->cancel:Z

    .line 220
    iput-boolean v2, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->append:Z

    .line 228
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 229
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    .line 231
    if-eqz p2, :cond_1

    .line 232
    iget-object v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    iget-object v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 241
    :cond_0
    :goto_0
    return-void

    .line 236
    :cond_1
    iget-boolean v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->append:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    goto :goto_0
.end method


# virtual methods
.method public getSkipSize()J
    .locals 2

    .prologue
    .line 370
    iget-wide v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    return-wide v0
.end method

.method protected handleFailureMessage(Ljava/lang/Throwable;Ljava/io/File;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 276
    invoke-virtual {p0, p1, p2}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->onFailure(Ljava/lang/Throwable;Ljava/io/File;)V

    .line 277
    return-void
.end method

.method protected handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 285
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 299
    :pswitch_0
    invoke-super {p0, p1}, Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;->handleMessage(Landroid/os/Message;)V

    .line 302
    :goto_0
    return-void

    .line 287
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 288
    .local v0, "response":[Ljava/lang/Object;
    aget-object v1, v0, v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v0, v4

    check-cast v1, Ljava/io/File;

    invoke-virtual {p0, v2, v1}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->handleSuccessMessage(ILjava/io/File;)V

    goto :goto_0

    .line 291
    .end local v0    # "response":[Ljava/lang/Object;
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 292
    .restart local v0    # "response":[Ljava/lang/Object;
    aget-object v1, v0, v2

    check-cast v1, Ljava/lang/Throwable;

    aget-object v2, v0, v4

    check-cast v2, Ljava/io/File;

    invoke-virtual {p0, v1, v2}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->handleFailureMessage(Ljava/lang/Throwable;Ljava/io/File;)V

    goto :goto_0

    .line 295
    .end local v0    # "response":[Ljava/lang/Object;
    :pswitch_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 296
    .restart local v0    # "response":[Ljava/lang/Object;
    aget-object v1, v0, v2

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    aget-object v1, v0, v4

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->handleProgressMessage(JJ)V

    goto :goto_0

    .line 285
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method protected handleProgressMessage(JJ)V
    .locals 0
    .param p1, "current"    # J
    .param p3, "total"    # J

    .prologue
    .line 280
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->onProgress(JJ)V

    .line 281
    return-void
.end method

.method protected handleSuccessMessage(ILjava/io/File;)V
    .locals 0
    .param p1, "statusCode"    # I
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 272
    invoke-virtual {p0, p1, p2}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->onSuccess(ILjava/io/File;)V

    .line 273
    return-void
.end method

.method public onFailure(Ljava/lang/Throwable;Ljava/io/File;)V
    .locals 0
    .param p1, "error"    # Ljava/lang/Throwable;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 252
    invoke-virtual {p0, p1}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->onFailure(Ljava/lang/Throwable;)V

    .line 253
    return-void
.end method

.method public onProgress(JJ)V
    .locals 0
    .param p1, "current"    # J
    .param p3, "total"    # J

    .prologue
    .line 257
    return-void
.end method

.method public onSuccess(ILjava/io/File;)V
    .locals 0
    .param p1, "statusCode"    # I
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 248
    invoke-virtual {p0, p2}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->onSuccess(Ljava/io/File;)V

    .line 249
    return-void
.end method

.method public onSuccess(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 245
    return-void
.end method

.method protected sendFailureMessage(Ljava/lang/Throwable;Ljava/io/File;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x1

    .line 264
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    aput-object p2, v0, v2

    invoke-virtual {p0, v2, v0}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 265
    return-void
.end method

.method protected sendProgressMessage(JJ)V
    .locals 4
    .param p1, "current"    # J
    .param p3, "total"    # J

    .prologue
    .line 268
    const/4 v0, 0x4

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 269
    return-void
.end method

.method sendResponseMessage(Lorg/apache/http/HttpResponse;)V
    .locals 16
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 305
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->cancel:Z

    if-nez v12, :cond_0

    .line 306
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    .line 308
    .local v11, "status":Lorg/apache/http/StatusLine;
    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    const/16 v13, 0x1a0

    if-ne v12, v13, :cond_1

    .line 309
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendProgressMessage(JJ)V

    .line 310
    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendSuccessMessage(ILjava/io/File;)V

    .line 363
    .end local v11    # "status":Lorg/apache/http/StatusLine;
    :cond_0
    :goto_0
    return-void

    .line 312
    .restart local v11    # "status":Lorg/apache/http/StatusLine;
    :cond_1
    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    const/16 v13, 0x12c

    if-lt v12, v13, :cond_2

    .line 313
    new-instance v12, Lorg/apache/http/client/HttpResponseException;

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/http/client/HttpResponseException;-><init>(ILjava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/io/File;)V

    goto :goto_0

    .line 316
    :cond_2
    const/4 v7, 0x0

    .line 317
    .local v7, "is":Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 319
    .local v8, "os":Ljava/io/FileOutputStream;
    :try_start_0
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    .line 320
    .local v5, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v5, :cond_6

    .line 321
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_7

    .line 322
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->createNewFile()Z

    .line 329
    :cond_3
    const-string v12, "Content-Range"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v6

    .line 330
    .local v6, "headers":[Lorg/apache/http/Header;
    array-length v12, v6

    if-nez v12, :cond_4

    .line 331
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->append:Z

    .line 332
    const-wide/16 v12, 0x0

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    .line 335
    :cond_4
    new-instance v9, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->append:Z

    invoke-direct {v9, v12, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    .end local v8    # "os":Ljava/io/FileOutputStream;
    .local v9, "os":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    .line 337
    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    add-long v2, v12, v14

    .line 338
    .local v2, "count":J
    const/4 v10, 0x0

    .line 339
    .local v10, "readLen":I
    const/16 v12, 0x1000

    new-array v1, v12, [B

    .line 340
    .local v1, "buffer":[B
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->cancel:Z

    if-nez v12, :cond_5

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    cmp-long v12, v12, v2

    if-gez v12, :cond_5

    const/4 v12, 0x0

    const/16 v13, 0x1000

    invoke-virtual {v7, v1, v12, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v10

    if-gtz v10, :cond_8

    .line 345
    :cond_5
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->flush()V

    .line 346
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->cancel:Z

    if-nez v12, :cond_9

    .line 347
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->append:Z

    .line 348
    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendSuccessMessage(ILjava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v8, v9

    .line 355
    .end local v1    # "buffer":[B
    .end local v2    # "count":J
    .end local v6    # "headers":[Lorg/apache/http/Header;
    .end local v9    # "os":Ljava/io/FileOutputStream;
    .end local v10    # "readLen":I
    .restart local v8    # "os":Ljava/io/FileOutputStream;
    :cond_6
    :goto_2
    :try_start_2
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 356
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 357
    :catch_0
    move-exception v4

    .line 358
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 324
    .end local v4    # "e":Ljava/io/IOException;
    :cond_7
    :try_start_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->canWrite()Z

    move-result v12

    if-nez v12, :cond_3

    .line 325
    new-instance v12, Ljava/io/IOException;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Writing Permission Denied:"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->file:Ljava/io/File;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 355
    :try_start_4
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 356
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 357
    :catch_1
    move-exception v4

    .line 358
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 341
    .end local v4    # "e":Ljava/io/IOException;
    .end local v8    # "os":Ljava/io/FileOutputStream;
    .restart local v1    # "buffer":[B
    .restart local v2    # "count":J
    .restart local v6    # "headers":[Lorg/apache/http/Header;
    .restart local v9    # "os":Ljava/io/FileOutputStream;
    .restart local v10    # "readLen":I
    :cond_8
    const/4 v12, 0x0

    :try_start_5
    invoke-virtual {v9, v1, v12, v10}, Ljava/io/FileOutputStream;->write([BII)V

    .line 342
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    int-to-long v14, v10

    add-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    .line 343
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->current:J

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v2, v3}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendProgressMessage(JJ)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto/16 :goto_1

    .line 351
    .end local v1    # "buffer":[B
    .end local v2    # "count":J
    .end local v10    # "readLen":I
    :catch_2
    move-exception v4

    move-object v8, v9

    .line 352
    .end local v5    # "entity":Lorg/apache/http/HttpEntity;
    .end local v6    # "headers":[Lorg/apache/http/Header;
    .end local v9    # "os":Ljava/io/FileOutputStream;
    .restart local v4    # "e":Ljava/io/IOException;
    .restart local v8    # "os":Ljava/io/FileOutputStream;
    :goto_3
    :try_start_6
    const-string v12, "IOException"

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v12}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendFailureMessage(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 355
    :try_start_7
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 356
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto/16 :goto_0

    .line 357
    :catch_3
    move-exception v4

    .line 358
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 353
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v12

    .line 355
    :goto_4
    :try_start_8
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 356
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 360
    :goto_5
    throw v12

    .line 357
    :catch_4
    move-exception v4

    .line 358
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5

    .line 353
    .end local v4    # "e":Ljava/io/IOException;
    .end local v8    # "os":Ljava/io/FileOutputStream;
    .restart local v5    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v6    # "headers":[Lorg/apache/http/Header;
    .restart local v9    # "os":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v12

    move-object v8, v9

    .end local v9    # "os":Ljava/io/FileOutputStream;
    .restart local v8    # "os":Ljava/io/FileOutputStream;
    goto :goto_4

    .line 351
    .end local v5    # "entity":Lorg/apache/http/HttpEntity;
    .end local v6    # "headers":[Lorg/apache/http/Header;
    :catch_5
    move-exception v4

    goto :goto_3

    .end local v8    # "os":Ljava/io/FileOutputStream;
    .restart local v1    # "buffer":[B
    .restart local v2    # "count":J
    .restart local v5    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v6    # "headers":[Lorg/apache/http/Header;
    .restart local v9    # "os":Ljava/io/FileOutputStream;
    .restart local v10    # "readLen":I
    :cond_9
    move-object v8, v9

    .end local v9    # "os":Ljava/io/FileOutputStream;
    .restart local v8    # "os":Ljava/io/FileOutputStream;
    goto/16 :goto_2
.end method

.method protected sendSuccessMessage(ILjava/io/File;)V
    .locals 3
    .param p1, "statusCode"    # I
    .param p2, "file"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 260
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-virtual {p0, v2, v0}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 261
    return-void
.end method

.method public setAppend(Z)V
    .locals 1
    .param p1, "append"    # Z

    .prologue
    .line 366
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/taomee/android/pay/HttpClient$FileHttpResponseHandler;->append:Z

    .line 367
    return-void
.end method
