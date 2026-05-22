.class public Lcom/taomee/android/crashlog/UploadCrashInfo;
.super Ljava/lang/Object;
.source "UploadCrashInfo.java"


# instance fields
.field private deleteFlag:Z

.field private final severUrl:Ljava/lang/String;

.field private uploadfile:Ljava/io/File;

.field private versionNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "http://10.1.1.101:8964/iapAdServer/crashit/trunk/index.php"

    iput-object v0, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->severUrl:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->deleteFlag:Z

    .line 15
    return-void
.end method

.method static synthetic access$0(Lcom/taomee/android/crashlog/UploadCrashInfo;)Ljava/io/File;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->uploadfile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$1(Lcom/taomee/android/crashlog/UploadCrashInfo;Ljava/util/Map;Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Lcom/taomee/android/crashlog/UploadCrashInfo;->doUploadImage(Ljava/util/Map;Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private doUploadImage(Ljava/util/Map;Ljava/io/File;)Ljava/lang/String;
    .locals 19
    .param p2, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/File;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v14, Ljava/net/URL;

    const-string v16, "http://10.1.1.101:8964/iapAdServer/crashit/trunk/index.php"

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 99
    .local v14, "url":Ljava/net/URL;
    const/4 v5, 0x0

    .line 100
    .local v5, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v14}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .end local v5    # "connection":Ljava/net/HttpURLConnection;
    check-cast v5, Ljava/net/HttpURLConnection;

    .line 102
    .restart local v5    # "connection":Ljava/net/HttpURLConnection;
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 103
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 104
    const-string v16, "POST"

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 105
    const/16 v16, 0x5dc0

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 107
    const-string v2, "0xKhTmLbOuNdArYcC"

    .line 109
    .local v2, "boundary":Ljava/lang/String;
    const-string v8, "Content-Type"

    .line 110
    .local v8, "key":Ljava/lang/String;
    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "multipart/form-data; boundary="

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 111
    .local v15, "value":Ljava/lang/String;
    invoke-virtual {v5, v8, v15}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    const/4 v3, 0x0

    .line 114
    .local v3, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    .end local v3    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/16 v16, 0x400

    move/from16 v0, v16

    invoke-direct {v3, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 116
    .restart local v3    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .local v13, "textEntity":Ljava/lang/StringBuilder;
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_0

    .line 125
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    const-string v17, "UTF-8"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 127
    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "--"

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\r\n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 128
    .local v12, "string":Ljava/lang/String;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v17, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 129
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v17, "file\"; filename=\"crash.dmp\"\r\n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 130
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v17, "Content-Type: application/octet-stream\r\n\r\n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 131
    const-string v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 133
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v3}, Lcom/taomee/android/crashlog/UploadCrashInfo;->write(Ljava/io/File;Ljava/io/OutputStream;)V

    .line 135
    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "\r\n--"

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "--\r\n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 136
    const-string v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 138
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 140
    const/4 v9, 0x0

    .line 141
    .local v9, "length":I
    const/16 v16, 0x400

    move/from16 v0, v16

    new-array v4, v0, [B

    .line 143
    .local v4, "bytes":[B
    const/4 v10, 0x0

    .line 144
    .local v10, "response":Ljava/io/ByteArrayOutputStream;
    new-instance v10, Ljava/io/ByteArrayOutputStream;

    .end local v10    # "response":Ljava/io/ByteArrayOutputStream;
    invoke-direct {v10}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 145
    .restart local v10    # "response":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 146
    .local v7, "input":Ljava/io/InputStream;
    :goto_1
    invoke-virtual {v7, v4}, Ljava/io/InputStream;->read([B)I

    move-result v9

    if-gtz v9, :cond_1

    .line 150
    const-string v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-virtual {v10, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 151
    .local v11, "result":Ljava/lang/String;
    return-object v11

    .line 117
    .end local v4    # "bytes":[B
    .end local v7    # "input":Ljava/io/InputStream;
    .end local v9    # "length":I
    .end local v10    # "response":Ljava/io/ByteArrayOutputStream;
    .end local v11    # "result":Ljava/lang/String;
    .end local v12    # "string":Ljava/lang/String;
    :cond_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 118
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v16, "--"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    const-string v16, "\r\n"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v16, "Content-Disposition: form-data; name=\""

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v18, "\"\r\n\r\n"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    const-string v16, "\r\n"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 147
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v4    # "bytes":[B
    .restart local v7    # "input":Ljava/io/InputStream;
    .restart local v9    # "length":I
    .restart local v10    # "response":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "string":Ljava/lang/String;
    :cond_1
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v10, v4, v0, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1
.end method

.method private write(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 155
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 156
    const/4 v1, 0x0

    .line 157
    .local v1, "input":Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/FileInputStream;

    .end local v1    # "input":Ljava/io/FileInputStream;
    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 158
    .restart local v1    # "input":Ljava/io/FileInputStream;
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 159
    .local v0, "buffer":[B
    const/4 v2, 0x0

    .line 160
    .local v2, "length":I
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    if-gtz v2, :cond_1

    .line 163
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 165
    .end local v0    # "buffer":[B
    .end local v1    # "input":Ljava/io/FileInputStream;
    .end local v2    # "length":I
    :cond_0
    return-void

    .line 161
    .restart local v0    # "buffer":[B
    .restart local v1    # "input":Ljava/io/FileInputStream;
    .restart local v2    # "length":I
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {p2, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method


# virtual methods
.method public upload(Landroid/content/Context;Ljava/lang/String;)V
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "gameName"    # Ljava/lang/String;

    .prologue
    .line 22
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    .line 23
    .local v9, "packageName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "/data/data/"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/dump"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v3, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_1

    .line 94
    .end local v3    # "file":Ljava/io/File;
    .end local v9    # "packageName":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 27
    .restart local v3    # "file":Ljava/io/File;
    .restart local v9    # "packageName":Ljava/lang/String;
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 28
    .local v4, "files":[Ljava/io/File;
    array-length v5, v4

    .line 29
    .local v5, "filesLength":I
    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v6

    .line 30
    .local v6, "filesString":[Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-lt v8, v5, :cond_2

    .line 71
    :goto_2
    iget-object v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->uploadfile:Ljava/io/File;

    if-eqz v12, :cond_0

    iget-object v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->uploadfile:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 74
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 75
    .local v10, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v12, "c"

    const-string v13, "app"

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v12, "a"

    const-string v13, "upload_dumpfile"

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const-string v12, "app"

    move-object/from16 v0, p2

    invoke-interface {v10, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string v12, "version"

    iget-object v13, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->versionNumber:Ljava/lang/String;

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    new-instance v12, Lcom/taomee/android/crashlog/UploadCrashInfo$1;

    invoke-direct {v12, p0, v10}, Lcom/taomee/android/crashlog/UploadCrashInfo$1;-><init>(Lcom/taomee/android/crashlog/UploadCrashInfo;Ljava/util/Map;)V

    .line 90
    invoke-virtual {v12}, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->start()V

    goto :goto_0

    .line 92
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "files":[Ljava/io/File;
    .end local v5    # "filesLength":I
    .end local v6    # "filesString":[Ljava/lang/String;
    .end local v8    # "i":I
    .end local v9    # "packageName":Ljava/lang/String;
    .end local v10    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v12

    goto :goto_0

    .line 31
    .restart local v3    # "file":Ljava/io/File;
    .restart local v4    # "files":[Ljava/io/File;
    .restart local v5    # "filesLength":I
    .restart local v6    # "filesString":[Ljava/lang/String;
    .restart local v8    # "i":I
    .restart local v9    # "packageName":Ljava/lang/String;
    :cond_2
    aget-object v12, v4, v8

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_5

    .line 32
    aget-object v12, v4, v8

    invoke-virtual {v12}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "dumpFiles":[Ljava/lang/String;
    array-length v12, v1

    if-lez v12, :cond_3

    .line 34
    new-instance v12, Ljava/io/File;

    aget-object v13, v4, v8

    const/4 v14, 0x0

    aget-object v14, v1, v14

    invoke-direct {v12, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->uploadfile:Ljava/io/File;

    .line 35
    aget-object v12, v4, v8

    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->versionNumber:Ljava/lang/String;

    goto :goto_2

    .line 38
    :cond_3
    const/4 v12, 0x1

    if-le v5, v12, :cond_5

    iget-boolean v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->deleteFlag:Z

    if-nez v12, :cond_5

    .line 39
    array-length v12, v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v13, 0x1

    if-le v12, v13, :cond_5

    .line 41
    const/4 v12, 0x0

    :try_start_1
    aget-object v12, v6, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 42
    .local v7, "first":I
    const/4 v12, 0x1

    aget-object v12, v6, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v11

    .line 44
    .local v11, "second":I
    if-ge v7, v11, :cond_4

    .line 45
    const/4 v12, 0x0

    :try_start_2
    aget-object v12, v4, v12

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 46
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->deleteFlag:Z

    .line 47
    :cond_4
    const/4 v12, 0x1

    aget-object v12, v4, v12

    invoke-virtual {v12}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v12

    array-length v12, v12

    if-nez v12, :cond_5

    .line 48
    const/4 v12, 0x1

    aget-object v12, v4, v12

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 49
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->deleteFlag:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 30
    .end local v1    # "dumpFiles":[Ljava/lang/String;
    .end local v7    # "first":I
    .end local v11    # "second":I
    :cond_5
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 54
    .restart local v1    # "dumpFiles":[Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 55
    .local v2, "e":Ljava/lang/Exception;
    const/4 v12, 0x0

    :try_start_3
    aget-object v12, v6, v12

    const/4 v13, 0x1

    aget-object v13, v6, v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v12

    if-gez v12, :cond_6

    .line 56
    const/4 v12, 0x0

    aget-object v12, v4, v12

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 57
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->deleteFlag:Z

    goto :goto_3

    .line 58
    :cond_6
    const/4 v12, 0x1

    aget-object v12, v4, v12

    invoke-virtual {v12}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v12

    array-length v12, v12

    if-nez v12, :cond_5

    .line 59
    const/4 v12, 0x1

    aget-object v12, v4, v12

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 60
    const/4 v12, 0x1

    iput-boolean v12, p0, Lcom/taomee/android/crashlog/UploadCrashInfo;->deleteFlag:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_3

    .line 51
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v7    # "first":I
    .restart local v11    # "second":I
    :catch_2
    move-exception v12

    goto :goto_3
.end method
