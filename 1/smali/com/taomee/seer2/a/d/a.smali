.class public Lcom/taomee/seer2/a/d/a;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/taomee/seer2/a/d/a;->a:Ljava/lang/Class;

    return-void
.end method

.method public static a()J
    .locals 2

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;
    .locals 4

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const/4 v1, 0x4

    :try_start_0
    invoke-static {p0, v0, v1}, Lcom/taomee/seer2/a/d/a;->a(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-object p1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_1
    array-length v1, v2

    if-ge v0, v1, :cond_0

    :try_start_1
    aget-object v1, v2, v0

    iget-object v1, v1, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_2

    move-object p1, v1

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "93f968c3784245eea047d233db61fc4d"

    invoke-static {p0, v0}, Lcom/taomee/seer2/a/d/a;->a(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static a(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 2

    :try_start_0
    invoke-static {p0}, Lcom/taomee/seer2/a/d/a;->f(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/taomee/seer2/a/d/b;->M:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->M:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    sget-object v0, Lcom/taomee/seer2/a/d/b;->aj:Ljava/lang/String;

    invoke-static {v0}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/taomee/seer2/a/d/b;->aj:Ljava/lang/String;

    invoke-static {v0, p0, v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;Ljava/lang/String;Z)Z

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/taomee/seer2/a/d/b;->aj:Ljava/lang/String;

    invoke-static {v0}, Lcom/taomee/seer2/a/d/d;->c(Ljava/lang/String;)Ljava/io/File;

    sget-object v0, Lcom/taomee/seer2/a/d/b;->aj:Ljava/lang/String;

    invoke-static {v0, p0, v1}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;Ljava/lang/String;Z)Z

    goto :goto_0
.end method

.method public static b()I
    .locals 1

    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Lcom/taomee/seer2/a/d/b;->aj:Ljava/lang/String;

    invoke-static {v2}, Lcom/taomee/seer2/a/d/d;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v1, Lcom/taomee/seer2/a/d/b;->aj:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/taomee/seer2/a/d/d;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/taomee/seer2/a/d/a;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_0
    if-eqz v0, :cond_1

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_1
    move-object v0, v1

    :cond_2
    :goto_0
    return-object v0

    :cond_3
    if-eq v1, v0, :cond_2

    invoke-static {v0}, Lcom/taomee/seer2/a/d/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/taomee/seer2/a/d/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    :try_start_0
    sget-object v0, Lcom/taomee/seer2/a/d/b;->X:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    sget-object v0, Lcom/taomee/seer2/a/d/b;->V:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v0, 0x0

    :goto_0
    array-length v4, v1

    if-ge v0, v4, :cond_0

    aget-byte v4, v1, v0

    and-int/lit16 v4, v4, 0xff

    array-length v5, v2

    rem-int v5, v0, v5

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    :goto_1
    return-object p0

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public static b(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 3

    :try_start_0
    invoke-static {p0}, Lcom/taomee/seer2/a/d/a;->f(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    if-nez p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/taomee/seer2/a/d/b;->Q:Ljava/lang/String;

    sget-object v2, Lcom/taomee/seer2/a/d/b;->B:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    sget-object v0, Lcom/taomee/seer2/a/d/b;->W:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_2

    :try_start_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    :try_start_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    new-array v2, v0, [B

    sget-object v0, Lcom/taomee/seer2/a/d/b;->V:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const/4 v0, 0x0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    array-length v5, v3

    rem-int v5, v1, v5

    aget-byte v5, v3, v5

    and-int/lit16 v5, v5, 0xff

    sub-int/2addr v0, v5

    int-to-byte v0, v0

    aput-byte v0, v2, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_3
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lcom/taomee/seer2/a/d/b;->X:Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-object p0, v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public static c(Landroid/content/Context;)Z
    .locals 2

    invoke-static {p0}, Lcom/taomee/seer2/a/d/a;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static d(Landroid/content/Context;)Z
    .locals 4

    const/4 v2, 0x1

    const/4 v1, 0x0

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v2

    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public static e(Landroid/content/Context;)V
    .locals 2

    :try_start_0
    invoke-static {p0}, Lcom/taomee/seer2/a/d/a;->f(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static f(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/a/d/a;->a:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Lcom/taomee/seer2/a/Yg;

    invoke-static {p0, v0}, Lcom/taomee/seer2/a/d/a;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/taomee/seer2/a/d/a;->a:Ljava/lang/Class;

    :cond_0
    sget-object v0, Lcom/taomee/seer2/a/d/a;->a:Ljava/lang/Class;

    return-object v0
.end method
