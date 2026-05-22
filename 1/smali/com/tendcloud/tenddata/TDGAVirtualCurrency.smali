.class public final Lcom/tendcloud/tenddata/TDGAVirtualCurrency;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/tendcloud/tenddata/TDGAVirtualCurrency;->a:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onChargeRequest(Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;DLjava/lang/String;)V
    .locals 14

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TDGAVirtualCurrency.onChargeRequest Called."

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "SDK not initialized. TDGAVirtualCurrency.onChargeRequest()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/tendcloud/tenddata/TDGAVirtualCurrency;->a:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v13

    new-instance v0, Lcom/tendcloud/tenddata/game/s;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v3, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    sget-object v12, Lcom/tendcloud/tenddata/game/s$a;->a:Lcom/tendcloud/tenddata/game/s$a;

    move-object v4, p0

    move-object v5, p1

    move-wide/from16 v6, p2

    move-object/from16 v8, p4

    move-wide/from16 v9, p5

    move-object/from16 v11, p7

    invoke-direct/range {v0 .. v12}, Lcom/tendcloud/tenddata/game/s;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;DLjava/lang/String;Lcom/tendcloud/tenddata/game/s$a;)V

    const/4 v1, 0x6

    invoke-static {v13, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v13, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const-class v1, Lcom/tendcloud/tenddata/TDGAVirtualCurrency;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/tendcloud/tenddata/TDGAVirtualCurrency;->a:Ljava/util/HashMap;

    invoke-virtual {v2, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static onChargeSuccess(Ljava/lang/String;)V
    .locals 13

    const/4 v3, 0x1

    const/4 v2, 0x0

    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAVirtualCurrency.onChargeSuccess Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAVirtualCurrency.onChargeSuccess()"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-class v1, Lcom/tendcloud/tenddata/TDGAVirtualCurrency;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/tendcloud/tenddata/TDGAVirtualCurrency;->a:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tendcloud/tenddata/game/s;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    new-instance v0, Lcom/tendcloud/tenddata/game/s;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v3, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    sget-object v12, Lcom/tendcloud/tenddata/game/s$a;->b:Lcom/tendcloud/tenddata/game/s$a;

    move-object v4, p0

    move-object v8, v5

    move-wide v9, v6

    move-object v11, v5

    invoke-direct/range {v0 .. v12}, Lcom/tendcloud/tenddata/game/s;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;DLjava/lang/String;Lcom/tendcloud/tenddata/game/s$a;)V

    :cond_1
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x7

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static onReward(DLjava/lang/String;)V
    .locals 7

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAVirtualCurrency.onReward Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAVirtualCurrency.onReward"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/tendcloud/tenddata/game/p;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v3, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    move-wide v4, p0

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/tendcloud/tenddata/game/p;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;DLjava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
