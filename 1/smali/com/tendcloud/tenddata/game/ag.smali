.class public final Lcom/tendcloud/tenddata/game/ag;
.super Ljava/lang/Object;


# static fields
.field public static a:Ljava/lang/String; = null

.field private static final b:J = 0x7530L


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized a()V
    .locals 14

    const-wide/16 v12, 0x7530

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-class v2, Lcom/tendcloud/tenddata/game/ag;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->d()J

    move-result-wide v3

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->g()J

    move-result-wide v5

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->h()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    const-wide/16 v10, 0x364

    cmp-long v10, v3, v10

    if-nez v10, :cond_1

    :goto_0
    if-eqz v0, :cond_0

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-static {v8, v9, v1, v0}, Lcom/tendcloud/tenddata/game/ag;->a(JILcom/tendcloud/tenddata/TDGAAccount;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v2

    return-void

    :cond_1
    sub-long v10, v8, v5

    cmp-long v10, v10, v12

    if-lez v10, :cond_2

    sub-long v10, v8, v3

    cmp-long v10, v10, v12

    if-gtz v10, :cond_3

    :cond_2
    cmp-long v10, v8, v3

    if-gez v10, :cond_5

    :cond_3
    const-wide/16 v10, 0x0

    cmp-long v10, v5, v10

    if-nez v10, :cond_4

    :try_start_1
    invoke-static {v7, v3, v4, v3, v4}, Lcom/tendcloud/tenddata/game/ag;->a(Ljava/lang/String;JJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_4
    :try_start_2
    invoke-static {v7, v3, v4, v5, v6}, Lcom/tendcloud/tenddata/game/ag;->a(Ljava/lang/String;JJ)V

    sub-long v3, v8, v5

    long-to-int v1, v3

    div-int/lit16 v1, v1, 0x3e8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_5
    move v0, v1

    goto :goto_0
.end method

.method private static a(JILcom/tendcloud/tenddata/TDGAAccount;)V
    .locals 2

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v0, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/r;->d(Ljava/lang/String;)V

    invoke-static {p0, p1}, Lcom/tendcloud/tenddata/game/r;->b(J)V

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Lcom/tendcloud/tenddata/game/r;->c(J)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->f()V

    new-instance v0, Lcom/tendcloud/tenddata/game/ac;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    invoke-direct {v0, v1, p3, p2}, Lcom/tendcloud/tenddata/game/ac;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;I)V

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    return-void
.end method

.method static declared-synchronized a(Lcom/tendcloud/tenddata/TDGAAccount$a;)V
    .locals 3

    const-class v1, Lcom/tendcloud/tenddata/game/ag;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/tendcloud/tenddata/TDGAAccount$a;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iget-object v2, p0, Lcom/tendcloud/tenddata/TDGAAccount$a;->b:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-static {v0, v2}, Lcom/tendcloud/tenddata/game/ag;->a(Lcom/tendcloud/tenddata/TDGAAccount;Lcom/tendcloud/tenddata/TDGAAccount;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized a(Lcom/tendcloud/tenddata/TDGAAccount;Lcom/tendcloud/tenddata/TDGAAccount;)V
    .locals 10

    const-class v7, Lcom/tendcloud/tenddata/game/ag;

    monitor-enter v7

    :try_start_0
    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->d()J

    move-result-wide v5

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->h()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    new-instance v0, Lcom/tendcloud/tenddata/game/am;

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->e()J

    move-result-wide v3

    sub-long v5, v8, v5

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/tendcloud/tenddata/game/am;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;JJ)V

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    const/4 v0, 0x0

    invoke-static {v8, v9, v0, p1}, Lcom/tendcloud/tenddata/game/ag;->a(JILcom/tendcloud/tenddata/TDGAAccount;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v7

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v7

    throw v0
.end method

.method private static a(Ljava/lang/String;JJ)V
    .locals 7

    invoke-static {p3, p4}, Lcom/tendcloud/tenddata/game/r;->c(J)V

    new-instance v0, Lcom/tendcloud/tenddata/game/am;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-static {}, Lcom/tendcloud/tenddata/game/r;->e()J

    move-result-wide v3

    sub-long v5, p3, p1

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/tendcloud/tenddata/game/am;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;JJ)V

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    return-void
.end method

.method public static declared-synchronized b()V
    .locals 4

    const-class v1, Lcom/tendcloud/tenddata/game/ag;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/tendcloud/tenddata/game/r;->c(J)V

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/TDGAAccount;->a()V
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
