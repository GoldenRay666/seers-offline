.class public final Lcom/tendcloud/tenddata/game/au;
.super Ljava/lang/Object;


# static fields
.field private static a:Landroid/os/Handler; = null

.field private static final b:I = 0x2bf20

.field private static final c:I = 0xbb8

.field private static final d:I = 0x1388

.field private static final e:I = 0x1

.field private static final f:I = 0x2

.field private static final g:I = 0x3

.field private static final h:I = 0x4

.field private static final i:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x0

    sput-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "unknow"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Loop"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Resume"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Pause"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Right Now"

    aput-object v2, v0, v1

    sput-object v0, Lcom/tendcloud/tenddata/game/au;->i:[Ljava/lang/String;

    new-instance v0, Lcom/tendcloud/tenddata/game/t;

    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->f:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/tendcloud/tenddata/game/t;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()V
    .locals 1

    const v0, 0x2bf20

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/au;->b(I)V

    return-void
.end method

.method static synthetic a(I)V
    .locals 0

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/au;->b(I)V

    return-void
.end method

.method static b()V
    .locals 4

    const v0, 0x2bf20

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/au;->b(I)V

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v1, 0x2

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private static declared-synchronized b(I)V
    .locals 5

    const-class v1, Lcom/tendcloud/tenddata/game/au;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v2, 0x1

    int-to-long v3, p0

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static c()V
    .locals 4

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v1, 0x3

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method public static d()V
    .locals 2

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->a:Landroid/os/Handler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method static synthetic e()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/game/au;->i:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic f()V
    .locals 0

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->g()V

    return-void
.end method

.method private static g()V
    .locals 8

    const/4 v7, 0x1

    const/4 v6, 0x0

    :try_start_0
    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/b;->b(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Network is not connected!"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    if-nez v0, :cond_2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TalkingDataGA.sContext is null..."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-array v1, v7, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "send() error : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_2
    :try_start_1
    invoke-static {}, Lcom/tendcloud/tenddata/game/ah;->a()Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/tendcloud/tenddata/game/u;

    invoke-direct {v1}, Lcom/tendcloud/tenddata/game/u;-><init>()V

    invoke-virtual {v1, v0}, Lcom/tendcloud/tenddata/game/u;->a(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/al;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v1, v0}, Lcom/tendcloud/tenddata/game/u;->b(Ljava/util/List;)V

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "success post:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x4

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :cond_3
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Send success : "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->b([Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
