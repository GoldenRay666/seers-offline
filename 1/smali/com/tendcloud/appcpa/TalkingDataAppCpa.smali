.class public Lcom/tendcloud/appcpa/TalkingDataAppCpa;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# instance fields
.field private b:Landroid/content/Context;

.field private c:Ljava/lang/String;

.field private d:Landroid/os/HandlerThread;

.field private e:Landroid/os/Handler;

.field private f:Lcom/tendcloud/appcpa/k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->c:Ljava/lang/String;

    new-instance v0, Lcom/tendcloud/appcpa/k;

    iget-object v1, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/tendcloud/appcpa/k;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->f:Lcom/tendcloud/appcpa/k;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "appcpa thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->d:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->d:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->d:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->e:Landroid/os/Handler;

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->e:Landroid/os/Handler;

    new-instance v1, Lcom/tendcloud/appcpa/l;

    invoke-direct {v1, p0}, Lcom/tendcloud/appcpa/l;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->f:Lcom/tendcloud/appcpa/k;

    return-object v0
.end method

.method private a()V
    .locals 2

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->e:Landroid/os/Handler;

    new-instance v1, Lcom/tendcloud/appcpa/c;

    invoke-direct {v1, p0}, Lcom/tendcloud/appcpa/c;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p0, p1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Landroid/content/Context;Ljava/lang/String;)V

    sget-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic b(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b:Landroid/content/Context;

    return-object v0
.end method

.method private b()V
    .locals 2

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->e:Landroid/os/Handler;

    new-instance v1, Lcom/tendcloud/appcpa/j;

    invoke-direct {v1, p0}, Lcom/tendcloud/appcpa/j;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static declared-synchronized b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    const-class v1, Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    :cond_1
    if-eqz p0, :cond_0

    :try_start_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2, p1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static synthetic c(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->c:Ljava/lang/String;

    return-object v0
.end method

.method public static customizedTrackPoint(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p0, p1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Landroid/content/Context;Ljava/lang/String;)V

    sget-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic d(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->e:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic e(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V
    .locals 0

    invoke-direct {p0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a()V

    return-void
.end method

.method public static launchAppcpa(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    :try_start_0
    invoke-static {p0, p1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "appepa"

    const-string v2, "error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
