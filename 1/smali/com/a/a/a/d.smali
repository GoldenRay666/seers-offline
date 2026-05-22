.class public Lcom/a/a/a/d;
.super Ljava/lang/Object;


# static fields
.field static a:Landroid/telephony/TelephonyManager;

.field private static final b:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "UNKNOWN"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "GPRS"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "EDGE"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "UMTS"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "CDMA"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "EVDO_0"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "EVDO_A"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "1xRTT"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "HSDPA"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "HSUPA"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "HSPA"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "IDEN"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "EVDO_B"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "LTE"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "EHRPD"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "HSPAP"

    aput-object v2, v0, v1

    sput-object v0, Lcom/a/a/a/d;->b:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Landroid/content/Context;)V
    .locals 1

    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    sput-object v0, Lcom/a/a/a/d;->a:Landroid/telephony/TelephonyManager;

    return-void
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p0, v0}, Lcom/a/a/a/c;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    :try_start_0
    new-instance v0, Ljava/net/Socket;

    const-string v3, "www.talkingdata.net"

    const/16 v4, 0x50

    invoke-direct {v0, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v0

    move v0, v2

    goto :goto_0
.end method

.method public static c(Landroid/content/Context;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p0, v0}, Lcom/a/a/a/c;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v3

    if-ne v1, v3, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method public static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const/4 v2, 0x0

    invoke-static {p0}, Lcom/a/a/a/d;->b(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "OFFLINE"

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {p0}, Lcom/a/a/a/d;->c(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "WIFI"

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/a/a/a/d;->b:[Ljava/lang/String;

    aget-object v0, v0, v2

    const-string v1, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v1}, Lcom/a/a/a/c;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/a/a/a/d;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_3

    invoke-static {p0}, Lcom/a/a/a/d;->a(Landroid/content/Context;)V

    :cond_3
    sget-object v0, Lcom/a/a/a/d;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v0

    if-ltz v0, :cond_4

    sget-object v1, Lcom/a/a/a/d;->b:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_4

    sget-object v1, Lcom/a/a/a/d;->b:[Ljava/lang/String;

    aget-object v0, v1, v0

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/a/a/a/d;->b:[Ljava/lang/String;

    aget-object v0, v0, v2

    goto :goto_0
.end method
