.class public Lcom/taomee/seer2/a/a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/taomee/seer2/a/a/b;


# static fields
.field private static a:Lcom/taomee/seer2/a/a;


# instance fields
.field private b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/taomee/seer2/a/a;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/a/a;->a:Lcom/taomee/seer2/a/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/a/a;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/a/a;-><init>(Landroid/content/Context;)V

    :goto_0
    sput-object v0, Lcom/taomee/seer2/a/a;->a:Lcom/taomee/seer2/a/a;

    return-object v0

    :cond_0
    sget-object v0, Lcom/taomee/seer2/a/a;->a:Lcom/taomee/seer2/a/a;

    goto :goto_0
.end method

.method private a(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/taomee/seer2/a/a/c;

    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lcom/taomee/seer2/a/a/c;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->ag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/a/a/c;->b(Ljava/lang/String;)V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/a/a/c;->a(Ljava/lang/String;)V

    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/a/a/c;->a(Landroid/os/Handler;)V

    invoke-virtual {v0}, Lcom/taomee/seer2/a/a/c;->a()V

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v2, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_2

    invoke-direct {p0, p2}, Lcom/taomee/seer2/a/a;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v2}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private a()Z
    .locals 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    sget-object v4, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    sget-object v5, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v5, v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/taomee/seer2/a/a/d;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-static {v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v0}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v3, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/a/d/d;->b(Ljava/lang/String;)Ljava/io/File;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/a/d/a;->e(Landroid/content/Context;)V

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    invoke-static {v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v2, v4}, Lcom/taomee/seer2/a/a/d;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_0

    :cond_5
    move v0, v1

    goto :goto_0
.end method

.method private b()Z
    .locals 8

    const/4 v0, 0x0

    invoke-static {}, Lcom/taomee/seer2/a/d/d;->c()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/a/d/a;->c(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/a/d/a;->d(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/a/d/a;->e(Landroid/content/Context;)V

    :cond_1
    :goto_0
    return v0

    :cond_2
    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->P:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/a/d/b;->S:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {}, Lcom/taomee/seer2/a/d/a;->a()J

    move-result-wide v3

    sget-object v5, Lcom/taomee/seer2/a/d/b;->T:Ljava/lang/String;

    const-wide/16 v6, 0x0

    invoke-interface {v1, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    sub-long/2addr v3, v5

    mul-int/lit16 v2, v2, 0x3e8

    mul-int/lit8 v2, v2, 0x3c

    int-to-long v5, v2

    cmp-long v2, v3, v5

    if-ltz v2, :cond_1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/a/d/b;->T:Ljava/lang/String;

    invoke-static {}, Lcom/taomee/seer2/a/d/a;->a()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :try_start_0
    sget-object v1, Lcom/taomee/seer2/a/d/b;->J:Ljava/lang/String;

    invoke-direct {p0}, Lcom/taomee/seer2/a/a;->c()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/taomee/seer2/a/d/c;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/taomee/seer2/a/a/a;

    new-instance v3, Ljava/net/URI;

    sget-object v4, Lcom/taomee/seer2/a/d/b;->U:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lcom/taomee/seer2/a/a/a;-><init>(Ljava/net/URI;[B)V

    invoke-virtual {v2, p0}, Lcom/taomee/seer2/a/a/a;->a(Lcom/taomee/seer2/a/a/b;)V

    invoke-virtual {v2}, Lcom/taomee/seer2/a/a/a;->a()V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0

    :catch_2
    move-exception v1

    goto :goto_0

    :catch_3
    move-exception v1

    goto :goto_0

    :catch_4
    move-exception v1

    goto :goto_0

    :catch_5
    move-exception v1

    goto :goto_0
.end method

.method private c()Lorg/json/JSONObject;
    .locals 7

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    sget-object v1, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v1, v4}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    sget-object v5, Lcom/taomee/seer2/a/d/b;->b:Ljava/lang/String;

    invoke-static {}, Lcom/taomee/seer2/a/d/a;->b()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    sget-object v5, Lcom/taomee/seer2/a/d/b;->c:Ljava/lang/String;

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v5, Lcom/taomee/seer2/a/d/b;->d:Ljava/lang/String;

    iget-object v6, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v6}, Lcom/taomee/seer2/a/d/a;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v5, Lcom/taomee/seer2/a/d/b;->e:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->n:Ljava/lang/String;

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->p:Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/a;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->r:Ljava/lang/String;

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->v:Ljava/lang/String;

    sget-object v3, Lcom/taomee/seer2/a/d/b;->O:Ljava/lang/String;

    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->x:Ljava/lang/String;

    const/4 v3, 0x5

    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->y:Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    :goto_1
    return-object v2

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_0
    move-object v1, v2

    goto :goto_0
.end method


# virtual methods
.method public a(ILjava/lang/Exception;)V
    .locals 0

    return-void
.end method

.method public a(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Lcom/taomee/seer2/a/a;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/taomee/seer2/a/a;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/taomee/seer2/a/d/a;->a(Landroid/content/Context;Landroid/os/Bundle;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/taomee/seer2/a/a;->b()Z

    goto :goto_0
.end method

.method public a([B)V
    .locals 4

    :try_start_0
    sget-object v0, Lcom/taomee/seer2/a/d/b;->J:Ljava/lang/String;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([B)V

    invoke-static {v0, v1}, Lcom/taomee/seer2/a/d/c;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/taomee/seer2/a/c/a;

    invoke-direct {v1, v0}, Lcom/taomee/seer2/a/c/a;-><init>(Ljava/lang/String;)V

    const-class v0, Lcom/taomee/seer2/a/c/d;

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/a/c/a;->a(Ljava/lang/Class;)Lcom/taomee/seer2/a/c/b;

    move-result-object v0

    check-cast v0, Lcom/taomee/seer2/a/c/d;

    iget-object v0, v0, Lcom/taomee/seer2/a/c/d;->b:Ljava/lang/String;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->Z:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-class v0, Lcom/taomee/seer2/a/c/c;

    invoke-virtual {v1, v0}, Lcom/taomee/seer2/a/c/a;->a(Ljava/lang/Class;)Lcom/taomee/seer2/a/c/b;

    move-result-object v0

    check-cast v0, Lcom/taomee/seer2/a/c/c;

    sget-object v1, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/taomee/seer2/a/c/c;->b:Ljava/lang/String;

    iget-object v2, v0, Lcom/taomee/seer2/a/c/c;->a:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/taomee/seer2/a/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object v1, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->P:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    sget-object v2, Lcom/taomee/seer2/a/d/b;->S:Ljava/lang/String;

    iget v0, v0, Lcom/taomee/seer2/a/c/c;->c:I

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget-object v1, v0, Lcom/taomee/seer2/a/c/c;->a:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/taomee/seer2/a/a;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    goto :goto_1

    :catch_4
    move-exception v0

    goto :goto_1
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 5

    const/4 v1, 0x1

    const/4 v0, 0x0

    iget v2, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    sget-object v3, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    sget-object v4, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v4, v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/taomee/seer2/a/a/d;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    :goto_0
    return v0

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v2}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/a/d/d;->b(Ljava/lang/String;)Ljava/io/File;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v2, Lcom/taomee/seer2/a/d/b;->Q:Ljava/lang/String;

    sget-object v3, Lcom/taomee/seer2/a/d/b;->B:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/taomee/seer2/a/d/a;->b(Landroid/content/Context;Landroid/os/Bundle;)V

    move v0, v1

    goto/16 :goto_0

    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v3, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_2

    sget-object v0, Lcom/taomee/seer2/a/d/b;->ai:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/taomee/seer2/a/a;->b:Landroid/content/Context;

    invoke-static {v3}, Lcom/taomee/seer2/a/d/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->F:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/taomee/seer2/a/d/b;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
