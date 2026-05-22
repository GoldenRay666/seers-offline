.class public Le22/c55/s88/c/g;
.super Ljava/lang/Object;

# interfaces
.implements Le22/c55/s88/c/f;


# static fields
.field private static v:Ljava/lang/String;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:D

.field public k:D

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:I

.field public t:Ljava/lang/String;

.field public u:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "1.0.4"

    sput-object v0, Le22/c55/s88/c/g;->v:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    iput v0, p0, Le22/c55/s88/c/g;->u:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->b:Ljava/lang/String;

    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    iput-object v0, p0, Le22/c55/s88/c/g;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->q:Ljava/lang/String;

    invoke-static {p1}, Le22/c55/s88/f/a;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->c:Ljava/lang/String;

    invoke-direct {p0, p1}, Le22/c55/s88/c/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->d:Ljava/lang/String;

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v0, p0, Le22/c55/s88/c/g;->g:I

    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Le22/c55/s88/c/g;->h:I

    iget v0, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v0, p0, Le22/c55/s88/c/g;->i:I

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v2, p0, Le22/c55/s88/c/g;->e:Ljava/lang/String;

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    iput v1, p0, Le22/c55/s88/c/g;->f:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    sget-object v1, Le22/c55/s88/f/e;->l:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->n:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    invoke-static {p1}, Le22/c55/s88/f/a;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->o:Ljava/lang/String;

    invoke-static {p1}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/c/g;->m:Ljava/lang/String;

    iget-object v0, p0, Le22/c55/s88/c/g;->m:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "unknown"

    iput-object v0, p0, Le22/c55/s88/c/g;->m:Ljava/lang/String;

    :cond_0
    invoke-static {p1}, Le22/c55/s88/f/a;->g(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Le22/c55/s88/c/g;->p:Z

    invoke-static {p1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Le22/c55/s88/c/g;->s:I

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private a(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "wifi"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Le22/c55/s88/c/g;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    goto :goto_0
.end method

.method private a(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    :try_start_0
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update([B)V

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    :goto_1
    array-length v4, v2

    if-ge v1, v4, :cond_1

    aget-byte v4, v2, v1

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public a()Lorg/json/JSONObject;
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "a"

    iget-object v2, p0, Le22/c55/s88/c/g;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "b"

    iget-object v2, p0, Le22/c55/s88/c/g;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "c"

    iget-object v2, p0, Le22/c55/s88/c/g;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "d"

    iget-object v2, p0, Le22/c55/s88/c/g;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "e"

    iget-object v2, p0, Le22/c55/s88/c/g;->e:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "f"

    iget v2, p0, Le22/c55/s88/c/g;->f:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "g"

    iget v2, p0, Le22/c55/s88/c/g;->g:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "h"

    iget v2, p0, Le22/c55/s88/c/g;->h:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "i"

    iget v2, p0, Le22/c55/s88/c/g;->i:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "j"

    iget-wide v2, p0, Le22/c55/s88/c/g;->j:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "k"

    iget-wide v2, p0, Le22/c55/s88/c/g;->k:D

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string v1, "l"

    iget-object v2, p0, Le22/c55/s88/c/g;->l:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "m"

    iget-object v2, p0, Le22/c55/s88/c/g;->m:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "n"

    iget-object v2, p0, Le22/c55/s88/c/g;->n:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "o"

    iget-object v2, p0, Le22/c55/s88/c/g;->o:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "p"

    iget-boolean v2, p0, Le22/c55/s88/c/g;->p:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "q"

    iget-object v2, p0, Le22/c55/s88/c/g;->q:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "r"

    iget-object v2, p0, Le22/c55/s88/c/g;->r:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "s"

    iget v2, p0, Le22/c55/s88/c/g;->s:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "t"

    iget-object v2, p0, Le22/c55/s88/c/g;->t:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "u"

    sget-object v2, Le22/c55/s88/c/g;->v:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "v"

    iget v2, p0, Le22/c55/s88/c/g;->u:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lorg/json/JSONObject;)V
    .locals 6

    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    const-string v4, "a"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v4, v1

    :goto_1
    iput-object v4, p0, Le22/c55/s88/c/g;->a:Ljava/lang/String;

    const-string v4, "b"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v4, v1

    :goto_2
    iput-object v4, p0, Le22/c55/s88/c/g;->b:Ljava/lang/String;

    const-string v4, "c"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v4, v1

    :goto_3
    iput-object v4, p0, Le22/c55/s88/c/g;->c:Ljava/lang/String;

    const-string v4, "d"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    move-object v4, v1

    :goto_4
    iput-object v4, p0, Le22/c55/s88/c/g;->d:Ljava/lang/String;

    const-string v4, "e"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    move-object v4, v1

    :goto_5
    iput-object v4, p0, Le22/c55/s88/c/g;->e:Ljava/lang/String;

    const-string v4, "f"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    move v4, v0

    :goto_6
    iput v4, p0, Le22/c55/s88/c/g;->f:I

    const-string v4, "g"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    move v4, v0

    :goto_7
    iput v4, p0, Le22/c55/s88/c/g;->g:I

    const-string v4, "h"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    move v4, v0

    :goto_8
    iput v4, p0, Le22/c55/s88/c/g;->h:I

    const-string v4, "i"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    move v4, v0

    :goto_9
    iput v4, p0, Le22/c55/s88/c/g;->i:I

    const-string v4, "j"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    move-wide v4, v2

    :goto_a
    iput-wide v4, p0, Le22/c55/s88/c/g;->j:D

    const-string v4, "k"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    :goto_b
    iput-wide v2, p0, Le22/c55/s88/c/g;->k:D

    const-string v2, "l"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    move-object v2, v1

    :goto_c
    iput-object v2, p0, Le22/c55/s88/c/g;->l:Ljava/lang/String;

    const-string v2, "m"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    move-object v2, v1

    :goto_d
    iput-object v2, p0, Le22/c55/s88/c/g;->m:Ljava/lang/String;

    const-string v2, "n"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    move-object v2, v1

    :goto_e
    iput-object v2, p0, Le22/c55/s88/c/g;->n:Ljava/lang/String;

    const-string v2, "o"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    move-object v2, v1

    :goto_f
    iput-object v2, p0, Le22/c55/s88/c/g;->o:Ljava/lang/String;

    const-string v2, "p"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    move v2, v0

    :goto_10
    iput-boolean v2, p0, Le22/c55/s88/c/g;->p:Z

    const-string v2, "q"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11

    move-object v2, v1

    :goto_11
    iput-object v2, p0, Le22/c55/s88/c/g;->q:Ljava/lang/String;

    const-string v2, "r"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    move-object v2, v1

    :goto_12
    iput-object v2, p0, Le22/c55/s88/c/g;->r:Ljava/lang/String;

    const-string v2, "s"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13

    const v2, 0x186a8

    :goto_13
    iput v2, p0, Le22/c55/s88/c/g;->s:I

    const-string v2, "t"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    move-object v2, v1

    :goto_14
    iput-object v2, p0, Le22/c55/s88/c/g;->t:Ljava/lang/String;

    const-string v2, "u"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15

    :goto_15
    sput-object v1, Le22/c55/s88/c/g;->v:Ljava/lang/String;

    const-string v1, "v"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    :goto_16
    iput v0, p0, Le22/c55/s88/c/g;->u:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    :cond_1
    :try_start_1
    const-string v4, "a"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_2
    const-string v4, "b"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2

    :cond_3
    const-string v4, "c"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_3

    :cond_4
    const-string v4, "d"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_4

    :cond_5
    const-string v4, "e"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_5

    :cond_6
    const-string v4, "f"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    goto/16 :goto_6

    :cond_7
    const-string v4, "g"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    goto/16 :goto_7

    :cond_8
    const-string v4, "h"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    goto/16 :goto_8

    :cond_9
    const-string v4, "i"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    goto/16 :goto_9

    :cond_a
    const-string v4, "j"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    goto/16 :goto_a

    :cond_b
    const-string v2, "k"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    goto/16 :goto_b

    :cond_c
    const-string v2, "l"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_c

    :cond_d
    const-string v2, "m"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_d

    :cond_e
    const-string v2, "n"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_e

    :cond_f
    const-string v2, "o"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_f

    :cond_10
    const-string v2, "p"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    goto/16 :goto_10

    :cond_11
    const-string v2, "q"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_11

    :cond_12
    const-string v2, "r"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_12

    :cond_13
    const-string v2, "s"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    goto/16 :goto_13

    :cond_14
    const-string v2, "t"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_14

    :cond_15
    const-string v1, "u"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_15

    :cond_16
    const-string v0, "v"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    goto/16 :goto_16
.end method

.method public b()Ljava/lang/String;
    .locals 1

    const-string v0, "a"

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
