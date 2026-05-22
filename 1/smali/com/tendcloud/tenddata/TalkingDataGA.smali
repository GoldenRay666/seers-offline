.class public final Lcom/tendcloud/tenddata/TalkingDataGA;
.super Ljava/lang/Object;


# static fields
.field public static DEBUG:Z = false

.field public static final PLATFORM_TYPE_AIR:I = 0x3

.field public static final PLATFORM_TYPE_COCOS2DX:I = 0x1

.field public static final PLATFORM_TYPE_NATIVE:I = 0x0

.field public static final PLATFORM_TYPE_UNITY:I = 0x2

.field public static a:Landroid/content/Context; = null

.field public static b:Ljava/lang/String; = null

.field static c:Ljava/lang/String; = null

.field static d:Ljava/util/concurrent/atomic/AtomicBoolean; = null

.field static final e:Ljava/lang/String; = "TDGA"

.field public static f:Landroid/os/HandlerThread; = null

.field private static final g:J = 0x36ee80L

.field private static final h:Ljava/lang/String; = "TDGA_APP_ID"

.field private static final i:Ljava/lang/String; = "TDGA_CHANNEL_ID"

.field private static j:Z

.field public static sPlatformType:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v1, 0x0

    sput-boolean v1, Lcom/tendcloud/tenddata/TalkingDataGA;->DEBUG:Z

    sput v1, Lcom/tendcloud/tenddata/TalkingDataGA;->sPlatformType:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    sput-boolean v1, Lcom/tendcloud/tenddata/TalkingDataGA;->j:Z

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Controller Message Processing Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->f:Landroid/os/HandlerThread;

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->f:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final a()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    return-object v0
.end method

.method private static a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v0, ""

    goto :goto_0
.end method

.method protected static a(Landroid/content/Context;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.initSDK() Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "TDGA_APP_ID"

    invoke-static {v0, v1}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "TDGA_CHANNEL_ID"

    invoke-static {v0, v2}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGA_APP_ID not found in AndroidManifest.xml!"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    if-nez v0, :cond_1

    const-string v0, "TalkingData"

    :cond_1
    invoke-static {p0, v1, v0}, Lcom/tendcloud/tenddata/TalkingDataGA;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "Failed to load meta-data"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static final a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method private static final a(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0, p2, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/tendcloud/tenddata/TalkingDataGA;->onEvent(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static final b()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->b:Ljava/lang/String;

    return-object v0
.end method

.method public static final b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x2

    invoke-static {p0, p1, v0}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method public static final c()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->c:Ljava/lang/String;

    return-object v0
.end method

.method public static d()Z
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method protected static getDeviceId()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/c;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.getDeviceId Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/c;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static declared-synchronized init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13

    const/4 v3, 0x0

    const/4 v2, 0x1

    const-class v4, Lcom/tendcloud/tenddata/TalkingDataGA;

    monitor-enter v4

    :try_start_0
    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    monitor-exit v4

    return-void

    :cond_0
    const/4 v1, 0x6

    :try_start_1
    new-array v1, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "Init SDK Version:"

    aput-object v6, v1, v5

    const/4 v5, 0x1

    const-string v6, "2.0.7.31"

    aput-object v6, v1, v5

    const/4 v5, 0x2

    const-string v6, "   APPID:"

    aput-object v6, v1, v5

    const/4 v5, 0x3

    aput-object p1, v1, v5

    const/4 v5, 0x4

    const-string v6, "   Channel:"

    aput-object v6, v1, v5

    const/4 v5, 0x5

    aput-object p2, v1, v5

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->b([Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sput-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {}, Lcom/tendcloud/tenddata/game/al;->a()V

    const-string v1, "android.permission.INTERNET"

    invoke-static {p0, v1}, Lcom/tendcloud/tenddata/game/y;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "stop working...application do not have permission to send data, you must add <uses-permission android:name=\"android.permission.INTERNET\"/> to your AndroidManifest.xml."

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v4

    throw v1

    :cond_1
    :try_start_2
    sput-object p1, Lcom/tendcloud/tenddata/TalkingDataGA;->b:Ljava/lang/String;

    sput-object p2, Lcom/tendcloud/tenddata/TalkingDataGA;->c:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xe

    if-lt v1, v7, :cond_2

    instance-of v1, p0, Landroid/app/Activity;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_2

    :try_start_3
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    move-object v1, v0

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    const-class v7, Lcom/tendcloud/tenddata/game/o;

    invoke-virtual {v7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "android.app.Application$ActivityLifecycleCallbacks"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "registerActivityLifecycleCallbacks"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    aput-object v8, v11, v12

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-virtual {v8, v1, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x1

    sput-boolean v1, Lcom/tendcloud/tenddata/TalkingDataGA;->j:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_2
    :goto_1
    :try_start_4
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Landroid/content/Context;)Lcom/tendcloud/tenddata/TDGAAccount;

    move-result-object v1

    sput-object v1, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/Context;)J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v1, v7, v9

    if-nez v1, :cond_6

    new-instance v1, Lcom/tendcloud/tenddata/game/j;

    invoke-direct {v1}, Lcom/tendcloud/tenddata/game/j;-><init>()V

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    invoke-static {p0, v5, v6}, Lcom/tendcloud/tenddata/game/r;->a(Landroid/content/Context;J)V

    :goto_2
    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->b()J

    move-result-wide v7

    sub-long v7, v5, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    const-wide/32 v9, 0x36ee80

    cmp-long v1, v7, v9

    if-lez v1, :cond_4

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/an;->b(Landroid/content/Context;)[[Ljava/lang/Long;

    move-result-object v3

    const/4 v1, 0x0

    aget-object v1, v3, v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/4 v1, 0x1

    aget-object v1, v3, v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    const-string v1, ""

    if-eqz v2, :cond_5

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/an;->c(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_3
    :goto_3
    new-instance v2, Lcom/tendcloud/tenddata/game/ae;

    invoke-direct {v2, v1, v9, v10}, Lcom/tendcloud/tenddata/game/ae;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    invoke-static {v5, v6}, Lcom/tendcloud/tenddata/game/r;->a(J)V

    :cond_4
    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->a()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "TDGA Initialized Completed."

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->b([Ljava/lang/String;)V

    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto/16 :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_5
    const-wide/32 v11, 0x19bfcc00

    cmp-long v2, v7, v11

    if-lez v2, :cond_3

    const/4 v1, 0x2

    aget-object v1, v3, v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v1

    goto :goto_3

    :cond_6
    move v2, v3

    goto :goto_2
.end method

.method private static onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.onEvent Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "onEvent(). event id is empty."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    new-instance v0, Lcom/tendcloud/tenddata/game/z;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/tendcloud/tenddata/game/z;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x5

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "TalkingDataGA.onEvent"

    aput-object v2, v1, v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static onEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    :try_start_0
    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDK not initialized. In TalkingDataGA.onEvent()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0, p0, p1}, Lcom/tendcloud/tenddata/TalkingDataGA;->onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "TalkingDataGA.onEvent"

    aput-object v2, v1, v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static final onKill()V
    .locals 5

    const/4 v3, 0x1

    const/4 v4, 0x0

    :try_start_0
    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDK not initialized. In TalkingDataGA.onKill()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/tendcloud/tenddata/game/ag;->b()V

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->d()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-array v1, v3, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TalkingDataGA onKill() : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onPause(Landroid/app/Activity;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    :try_start_0
    sget-boolean v0, Lcom/tendcloud/tenddata/TalkingDataGA;->j:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDK not initialized. In TalkingDataGA.onPause()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "TalkingDataGA.onPause"

    aput-object v2, v1, v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :try_start_1
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.onPause Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tendcloud/tenddata/TalkingDataGA;->b(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static final onResume(Landroid/app/Activity;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    :try_start_0
    sget-boolean v0, Lcom/tendcloud/tenddata/TalkingDataGA;->j:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/content/Context;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDK not initialized. TalkingDataGA.onResume()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "TalkingDataGA.onResume"

    aput-object v2, v1, v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :try_start_1
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.onResume Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected static final onResume(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    const/4 v4, 0x1

    const/4 v3, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "APP ID not allow empty. Please check it."

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    sget-boolean v0, Lcom/tendcloud/tenddata/TalkingDataGA;->j:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0, p1, p2}, Lcom/tendcloud/tenddata/TalkingDataGA;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDK not initialized. TalkingDataGA.onResume()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "TalkingDataGA.onResume"

    aput-object v2, v1, v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    :try_start_1
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.onResume Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tendcloud/tenddata/TalkingDataGA;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static final setVerboseLogEnabled()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/tendcloud/tenddata/TalkingDataGA;->DEBUG:Z

    return-void
.end method
