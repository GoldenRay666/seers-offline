.class public final Lcom/tendcloud/tenddata/game/ab;
.super Ljava/lang/Object;


# static fields
.field static final a:I = 0x1

.field static final b:I = 0x2

.field static final c:I = 0x3

.field static final d:I = 0x4

.field static final e:I = 0x5

.field static final f:I = 0x6

.field static final g:I = 0x7

.field static final h:I = 0x8

.field static final i:I = 0x9

.field static final j:I = 0xa

.field static final k:I = 0xb

.field static final l:I = 0xc

.field static final m:I = 0xd

.field static final n:I = 0xe

.field static final o:I = 0xf

.field private static p:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tendcloud/tenddata/game/ar;

    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->f:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/tendcloud/tenddata/game/ar;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/tendcloud/tenddata/game/ab;->p:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final a()Landroid/os/Handler;
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/game/ab;->p:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic a(Landroid/os/Message;)V
    .locals 0

    invoke-static {p0}, Lcom/tendcloud/tenddata/game/ab;->b(Landroid/os/Message;)V

    return-void
.end method

.method private static final b(Landroid/os/Message;)V
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

    const-string v2, "SDK not initialized. TalkingDataGAHandler.handleMessage()"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->c([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget v0, p0, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/ab;->c(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-array v1, v3, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MainHandler handleMessage() error : "

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

    :pswitch_2
    :try_start_1
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/ab;->d(Landroid/os/Message;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/tendcloud/tenddata/game/aq;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/tendcloud/tenddata/game/aq;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->d()V

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/tendcloud/tenddata/game/s;

    sget-object v1, Lcom/tendcloud/tenddata/game/s$a;->b:Lcom/tendcloud/tenddata/game/s$a;

    invoke-virtual {v0, v1}, Lcom/tendcloud/tenddata/game/s;->a(Lcom/tendcloud/tenddata/game/s$a;)V

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->d()V

    goto :goto_0

    :pswitch_6
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/ab;->e(Landroid/os/Message;)V

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->d()V

    goto :goto_0

    :pswitch_7
    invoke-static {p0}, Lcom/tendcloud/tenddata/game/ab;->f(Landroid/os/Message;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_3
        :pswitch_7
        :pswitch_3
    .end packed-switch
.end method

.method private static final c(Landroid/os/Message;)V
    .locals 0

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->b()V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ag;->a()V

    return-void
.end method

.method private static final d(Landroid/os/Message;)V
    .locals 0

    invoke-static {}, Lcom/tendcloud/tenddata/game/au;->c()V

    invoke-static {}, Lcom/tendcloud/tenddata/game/ag;->b()V

    return-void
.end method

.method private static final e(Landroid/os/Message;)V
    .locals 1

    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/tendcloud/tenddata/TDGAAccount$a;

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ag;->a(Lcom/tendcloud/tenddata/TDGAAccount$a;)V

    return-void
.end method

.method private static final f(Landroid/os/Message;)V
    .locals 3

    sget-object v1, Lcom/tendcloud/tenddata/TDGAAccount;->a:Lcom/tendcloud/tenddata/TDGAAccount;

    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-static {v1, v0}, Lcom/tendcloud/tenddata/game/ag;->a(Lcom/tendcloud/tenddata/TDGAAccount;Lcom/tendcloud/tenddata/TDGAAccount;)V

    new-instance v1, Lcom/tendcloud/tenddata/game/q;

    sget-object v2, Lcom/tendcloud/tenddata/game/ag;->a:Ljava/lang/String;

    iget-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/tendcloud/tenddata/TDGAAccount;

    invoke-direct {v1, v2, v0}, Lcom/tendcloud/tenddata/game/q;-><init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;)V

    invoke-static {v1}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/aq;)V

    return-void
.end method
