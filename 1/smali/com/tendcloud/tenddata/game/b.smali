.class public Lcom/tendcloud/tenddata/game/b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tendcloud/tenddata/game/b$a;
    }
.end annotation


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

    sput-object v0, Lcom/tendcloud/tenddata/game/b;->b:[Ljava/lang/String;

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

    sput-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    return-void
.end method

.method public static a()Z
    .locals 1

    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b()Lorg/apache/http/HttpHost;
    .locals 3

    invoke-static {}, Lcom/tendcloud/tenddata/game/b;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/apache/http/HttpHost;

    invoke-static {}, Landroid/net/Proxy;->getDefaultHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Landroid/net/Proxy;->getDefaultPort()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

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

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

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

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->b(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "OFFLINE"

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->c(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "WIFI"

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->b:[Ljava/lang/String;

    aget-object v0, v0, v2

    const-string v1, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v1}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_3

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->a(Landroid/content/Context;)V

    :cond_3
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v0

    if-ltz v0, :cond_4

    sget-object v1, Lcom/tendcloud/tenddata/game/b;->b:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_4

    sget-object v1, Lcom/tendcloud/tenddata/game/b;->b:[Ljava/lang/String;

    aget-object v0, v1, v0

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->b:[Ljava/lang/String;

    aget-object v0, v0, v2

    goto :goto_0
.end method

.method public static e(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->a(Landroid/content/Context;)V

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public static f(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->a(Landroid/content/Context;)V

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public static g(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->a(Landroid/content/Context;)V

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public static h(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->a(Landroid/content/Context;)V

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public static i(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    :try_start_0
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/b;->a(Landroid/content/Context;)V

    :cond_1
    sget-object v0, Lcom/tendcloud/tenddata/game/b;->a:Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v0

    instance-of v2, v0, Landroid/telephony/gsm/GsmCellLocation;

    if-eqz v2, :cond_3

    check-cast v0, Landroid/telephony/gsm/GsmCellLocation;

    if-eqz v0, :cond_2

    const-string v2, "gsm:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x9

    if-lt v2, v3, :cond_2

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/b$a;->a(Landroid/telephony/gsm/GsmCellLocation;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    :try_start_1
    instance-of v2, v0, Landroid/telephony/cdma/CdmaCellLocation;

    if-eqz v2, :cond_2

    check-cast v0, Landroid/telephony/cdma/CdmaCellLocation;

    if-eqz v0, :cond_2

    const-string v2, "cdma:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/telephony/cdma/CdmaCellLocation;->getBaseStationId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/telephony/cdma/CdmaCellLocation;->getNetworkId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/telephony/cdma/CdmaCellLocation;->getSystemId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/telephony/cdma/CdmaCellLocation;->getBaseStationLatitude()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/telephony/cdma/CdmaCellLocation;->getBaseStationLongitude()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static j(Landroid/content/Context;)Ljava/lang/String;
    .locals 6

    const/16 v5, 0x2f

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "android.permission.ACCESS_WIFI_STATE"

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "wifi"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    const/4 v1, 0x0

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getRssi()I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/ScanResult;

    iget-object v4, v0, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    if-eqz v4, :cond_1

    iget-object v4, v0, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, v0, Landroid/net/wifi/ScanResult;->BSSID:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v0, v0, Landroid/net/wifi/ScanResult;->level:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v4, 0x3b

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
