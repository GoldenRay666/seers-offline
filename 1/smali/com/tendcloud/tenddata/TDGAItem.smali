.class public final Lcom/tendcloud/tenddata/TDGAItem;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onPurchase(Ljava/lang/String;ID)V
    .locals 9

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAItem.onPurchase Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAItem.onPurchase()"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v8

    new-instance v0, Lcom/tendcloud/tenddata/game/v;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v3, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    move-wide v4, p2

    move-object v6, p0

    move v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/tendcloud/tenddata/game/v;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;DLjava/lang/String;I)V

    const/16 v1, 0xa

    invoke-static {v8, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method

.method public static onUse(Ljava/lang/String;I)V
    .locals 7

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAItem.onPurchase Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAItem.onUse()"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v6

    new-instance v0, Lcom/tendcloud/tenddata/game/ai;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v3, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    move-object v4, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/tendcloud/tenddata/game/ai;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;I)V

    const/16 v1, 0xb

    invoke-static {v6, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
