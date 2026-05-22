.class public final Lcom/tendcloud/tenddata/TDGAMission;
.super Ljava/lang/Object;


# static fields
.field public static a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, ""

    sput-object v0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onBegin(Ljava/lang/String;)V
    .locals 9

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAMission.onBegin Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAMission.onBegin()"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v8

    new-instance v0, Lcom/tendcloud/tenddata/game/i;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    const-string v4, ""

    const-wide/16 v5, 0x0

    sget-object v7, Lcom/tendcloud/tenddata/game/i$a;->a:Lcom/tendcloud/tenddata/game/i$a;

    move-object v3, p0

    invoke-direct/range {v0 .. v7}, Lcom/tendcloud/tenddata/game/i;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;JLcom/tendcloud/tenddata/game/i$a;)V

    const/16 v1, 0x9

    invoke-static {v8, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/r;->c(Ljava/lang/String;)V

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-virtual {v0, p0}, Lcom/tendcloud/tenddata/TDGAAccount;->a(Ljava/lang/String;)V

    :cond_1
    sput-object p0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    goto :goto_0
.end method

.method public static onCompleted(Ljava/lang/String;)V
    .locals 9

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAMission.onCompleted Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAMission.onCompleted()"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    if-nez v0, :cond_1

    const-wide/16 v5, 0x0

    :goto_1
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v8

    new-instance v0, Lcom/tendcloud/tenddata/game/i;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    const-string v4, ""

    sget-object v7, Lcom/tendcloud/tenddata/game/i$a;->b:Lcom/tendcloud/tenddata/game/i$a;

    move-object v3, p0

    invoke-direct/range {v0 .. v7}, Lcom/tendcloud/tenddata/game/i;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;JLcom/tendcloud/tenddata/game/i$a;)V

    const/16 v1, 0x9

    invoke-static {v8, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const-string v0, ""

    sput-object v0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    sget-object v0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/r;->c(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-virtual {v0, p0}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Ljava/lang/String;)J

    move-result-wide v5

    goto :goto_1
.end method

.method public static onFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "TDGAMission.onFailed Called."

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->d()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SDK not initialized. TDGAMission.onFailed"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    if-nez v0, :cond_1

    const-wide/16 v5, 0x0

    :goto_1
    invoke-static {}, Lcom/tendcloud/tenddata/game/ab;->a()Landroid/os/Handler;

    move-result-object v8

    new-instance v0, Lcom/tendcloud/tenddata/game/i;

    sget-object v1, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    sget-object v2, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    sget-object v7, Lcom/tendcloud/tenddata/game/i$a;->c:Lcom/tendcloud/tenddata/game/i$a;

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v7}, Lcom/tendcloud/tenddata/game/i;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;JLcom/tendcloud/tenddata/game/i$a;)V

    const/16 v1, 0x9

    invoke-static {v8, v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const-string v0, ""

    sput-object v0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    sget-object v0, Lcom/tendcloud/tenddata/TDGAMission;->a:Ljava/lang/String;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/r;->c(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-virtual {v0, p0}, Lcom/tendcloud/tenddata/TDGAAccount;->b(Ljava/lang/String;)J

    move-result-wide v5

    goto :goto_1
.end method
