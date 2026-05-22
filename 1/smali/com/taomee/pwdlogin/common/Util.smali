.class public Lcom/taomee/pwdlogin/common/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static MD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 161
    const/16 v11, 0x10

    new-array v2, v11, [C

    fill-array-data v2, :array_0

    .line 164
    .local v2, "hexDigits":[C
    :try_start_0
    const-string v11, "UTF-8"

    invoke-virtual {p0, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    .line 165
    .local v10, "strTemp":[B
    const-string v11, "MD5"

    invoke-static {v11}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 166
    .local v8, "mdTemp":Ljava/security/MessageDigest;
    invoke-virtual {v8, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 167
    invoke-virtual {v8}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    .line 168
    .local v7, "md":[B
    array-length v4, v7

    .line 169
    .local v4, "j":I
    mul-int/lit8 v11, v4, 0x2

    new-array v9, v11, [C

    .line 170
    .local v9, "str":[C
    const/4 v5, 0x0

    .line 171
    .local v5, "k":I
    const/4 v3, 0x0

    .local v3, "i":I
    move v6, v5

    .end local v5    # "k":I
    .local v6, "k":I
    :goto_0
    if-lt v3, v4, :cond_0

    .line 176
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11, v9}, Ljava/lang/String;-><init>([C)V

    .line 178
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v6    # "k":I
    .end local v7    # "md":[B
    .end local v8    # "mdTemp":Ljava/security/MessageDigest;
    .end local v9    # "str":[C
    .end local v10    # "strTemp":[B
    :goto_1
    return-object v11

    .line 172
    .restart local v3    # "i":I
    .restart local v4    # "j":I
    .restart local v6    # "k":I
    .restart local v7    # "md":[B
    .restart local v8    # "mdTemp":Ljava/security/MessageDigest;
    .restart local v9    # "str":[C
    .restart local v10    # "strTemp":[B
    :cond_0
    aget-byte v0, v7, v3

    .line 173
    .local v0, "byte0":B
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "k":I
    .restart local v5    # "k":I
    ushr-int/lit8 v11, v0, 0x4

    and-int/lit8 v11, v11, 0xf

    aget-char v11, v2, v11

    aput-char v11, v9, v6

    .line 174
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "k":I
    .restart local v6    # "k":I
    and-int/lit8 v11, v0, 0xf

    aget-char v11, v2, v11

    aput-char v11, v9, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 177
    .end local v0    # "byte0":B
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v6    # "k":I
    .end local v7    # "md":[B
    .end local v8    # "mdTemp":Ljava/security/MessageDigest;
    .end local v9    # "str":[C
    .end local v10    # "strTemp":[B
    :catch_0
    move-exception v1

    .line 178
    .local v1, "e":Ljava/lang/Exception;
    const/4 v11, 0x0

    goto :goto_1

    .line 161
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public static final byte2hex([B)Ljava/lang/String;
    .locals 5
    .param p0, "bArray"    # [B

    .prologue
    .line 253
    new-instance v2, Ljava/lang/StringBuffer;

    array-length v3, p0

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 255
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p0

    if-lt v0, v3, :cond_0

    .line 261
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 256
    :cond_0
    aget-byte v3, p0, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 257
    .local v1, "sTemp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_1

    .line 258
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 259
    :cond_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 255
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static doJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "obj"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 213
    const-string v1, ""

    .line 214
    .local v1, "result":Ljava/lang/String;
    if-eqz p0, :cond_0

    .line 215
    const-string v2, "{"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 217
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 218
    .local v0, "json":Lorg/json/JSONObject;
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 219
    if-nez v1, :cond_0

    .line 220
    const-string v1, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .end local v0    # "json":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-object v1

    .line 222
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static generateDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 110
    const-string v1, ""

    .line 112
    .local v1, "deviceId":Ljava/lang/String;
    const-string v7, "wifi"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 111
    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 113
    .local v6, "wifi":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 114
    .local v2, "info":Landroid/net/wifi/WifiInfo;
    const-string v3, ""

    .line 115
    .local v3, "mac":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 116
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v3

    .line 118
    :cond_0
    if-eqz v3, :cond_1

    const-string v7, ""

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 120
    :cond_1
    const-string v7, "phone"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 119
    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 121
    .local v5, "tm":Landroid/telephony/TelephonyManager;
    const-string v4, ""

    .line 122
    .local v4, "phoneId":Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 123
    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v4

    .line 125
    :cond_2
    if-eqz v4, :cond_3

    const-string v7, ""

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 126
    const-string v7, "000000"

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x7

    if-ge v7, v8, :cond_4

    .line 128
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "android_id"

    .line 127
    invoke-static {v7, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "android_id":Ljava/lang/String;
    move-object v1, v0

    .line 136
    .end local v0    # "android_id":Ljava/lang/String;
    .end local v4    # "phoneId":Ljava/lang/String;
    .end local v5    # "tm":Landroid/telephony/TelephonyManager;
    :goto_0
    return-object v1

    .line 131
    .restart local v4    # "phoneId":Ljava/lang/String;
    .restart local v5    # "tm":Landroid/telephony/TelephonyManager;
    :cond_4
    move-object v1, v4

    goto :goto_0

    .line 134
    .end local v4    # "phoneId":Ljava/lang/String;
    .end local v5    # "tm":Landroid/telephony/TelephonyManager;
    :cond_5
    move-object v1, v3

    goto :goto_0
.end method

.method public static getVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 146
    const-string v1, ""

    .line 148
    .local v1, "versionName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    .line 148
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 150
    .local v0, "info":Landroid/content/pm/PackageInfo;
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .end local v0    # "info":Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v1

    .line 151
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static httpGet(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "spec"    # Ljava/lang/String;
    .param p1, "paramsPart"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v7, Lcom/taomee/pwdlogin/common/Util$1;

    invoke-direct {v7}, Lcom/taomee/pwdlogin/common/Util$1;-><init>()V

    invoke-static {v7}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 60
    if-eqz p1, :cond_0

    const-string v7, ""

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 61
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "?"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 63
    :cond_0
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 64
    .local v6, "url":Ljava/net/URL;
    const-string v7, "MobileLogin"

    invoke-static {v7, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    # Short-circuit network: return an empty JSON object for offline mode
    const-string v4, "{}"

    .line 79
    return-object v4
.end method

.method public static httpPost(Ljava/lang/String;Ljava/io/File;)Ljava/lang/String;
    .locals 7
    .param p0, "spec"    # Ljava/lang/String;
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    const-string v0, "0xCA811D6530E70313"

    .line 84
    .local v0, "BOUNDARY":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 85
    .local v4, "url":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    .line 86
    .local v3, "connection":Ljava/net/HttpURLConnection;
    const-string v5, "POST"

    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 87
    const/16 v5, 0x3a98

    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 88
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 90
    const-string v5, "Content-Type"

    .line 91
    const-string v6, "multipart/formdata; boundary=0xCA811D6530E70313"

    .line 90
    invoke-virtual {v3, v5, v6}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const-string v1, "--0xCA811D6530E70313\r\n"

    .line 94
    .local v1, "body":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "Content-Disposition: formdata; name=\"file\"; filename=\"file\"\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 96
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "Content-Type: application/octet-stream\r\n\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 97
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 98
    .local v2, "byteArray":Ljava/io/ByteArrayOutputStream;
    const-string v5, "UTF-8"

    invoke-virtual {v1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 99
    invoke-static {v2, p1}, Lcom/taomee/pwdlogin/common/Util;->write(Ljava/io/ByteArrayOutputStream;Ljava/io/File;)V

    .line 100
    const-string v5, "\r\n--0xCA811D6530E70313--\r\n"

    .line 101
    const-string v6, "UTF-8"

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 100
    invoke-virtual {v2, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 102
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 103
    const-string v5, ""

    return-object v5
.end method

.method public static isNetValid(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 237
    .line 238
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 237
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 239
    .local v0, "cManage":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 241
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 242
    const/4 v2, 0x1

    .line 245
    .end local v1    # "networkInfo":Landroid/net/NetworkInfo;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static taomeeUDID()Ljava/lang/String;
    .locals 8

    .prologue
    const/16 v7, 0x6f

    const/16 v6, 0x6d

    const/16 v5, 0x65

    const/16 v4, 0x2e

    .line 188
    const/16 v2, 0xc

    new-array v0, v2, [C

    .line 189
    .local v0, "key":[C
    const/4 v2, 0x0

    const/16 v3, 0x63

    aput-char v3, v0, v2

    .line 190
    const/4 v2, 0x1

    aput-char v7, v0, v2

    .line 191
    const/4 v2, 0x2

    aput-char v6, v0, v2

    .line 192
    const/4 v2, 0x3

    aput-char v4, v0, v2

    .line 193
    const/4 v2, 0x4

    const/16 v3, 0x74

    aput-char v3, v0, v2

    .line 194
    const/4 v2, 0x5

    const/16 v3, 0x61

    aput-char v3, v0, v2

    .line 195
    const/4 v2, 0x6

    aput-char v7, v0, v2

    .line 196
    const/4 v2, 0x7

    aput-char v6, v0, v2

    .line 197
    const/16 v2, 0x8

    aput-char v5, v0, v2

    .line 198
    const/16 v2, 0x9

    aput-char v5, v0, v2

    .line 199
    const/16 v2, 0xa

    aput-char v4, v0, v2

    .line 200
    const/16 v2, 0xb

    const/16 v3, 0x2a

    aput-char v3, v0, v2

    .line 201
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    .line 202
    .local v1, "taomeeUDID":Ljava/lang/String;
    return-object v1
.end method

.method public static write(Ljava/io/ByteArrayOutputStream;Ljava/io/File;)V
    .locals 4
    .param p0, "byteArray"    # Ljava/io/ByteArrayOutputStream;
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 35
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 36
    .local v1, "inputStream":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 37
    .local v2, "len":I
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 38
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-gtz v2, :cond_1

    .line 41
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 43
    .end local v0    # "buffer":[B
    .end local v1    # "inputStream":Ljava/io/InputStream;
    .end local v2    # "len":I
    :cond_0
    return-void

    .line 39
    .restart local v0    # "buffer":[B
    .restart local v1    # "inputStream":Ljava/io/InputStream;
    .restart local v2    # "len":I
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0
.end method
