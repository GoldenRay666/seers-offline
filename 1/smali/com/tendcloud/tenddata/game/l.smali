.class public Lcom/tendcloud/tenddata/game/l;
.super Ljava/lang/Object;


# static fields
.field private static final l:Ljava/lang/String; = "sequenceNumber"

.field private static final m:Ljava/lang/String; = "appPackageName"

.field private static final n:Ljava/lang/String; = "appVersionName"

.field private static final o:Ljava/lang/String; = "sdkVersion"

.field private static final p:Ljava/lang/String; = "sdkType"

.field private static final q:Ljava/lang/String; = "partner"

.field private static final r:Ljava/lang/String; = "appDisplayName"

.field private static final s:Ljava/lang/String; = "isCracked"

.field private static final t:Ljava/lang/String; = "installationTime"

.field private static final u:Ljava/lang/String; = "purchaseTime"

.field private static v:Lcom/tendcloud/tenddata/game/l;


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:J

.field e:J

.field f:Z

.field g:I

.field h:Ljava/lang/String;

.field i:Ljava/lang/String;

.field j:Ljava/lang/String;

.field k:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/tendcloud/tenddata/game/l;->v:Lcom/tendcloud/tenddata/game/l;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->b:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->c:Ljava/lang/String;

    iput-wide v2, p0, Lcom/tendcloud/tenddata/game/l;->d:J

    iput-wide v2, p0, Lcom/tendcloud/tenddata/game/l;->e:J

    iput-boolean v1, p0, Lcom/tendcloud/tenddata/game/l;->f:Z

    iput v1, p0, Lcom/tendcloud/tenddata/game/l;->g:I

    const-string v0, "2.0.7.31"

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->h:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->c()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->i:Ljava/lang/String;

    const-string v0, "Android SDK"

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->j:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->b()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->k:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/k;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->a:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/k;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->b:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/r;->b(Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tendcloud/tenddata/game/l;->d:J

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/k;->e(Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tendcloud/tenddata/game/l;->e:J

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/k;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->c:Ljava/lang/String;

    sget v0, Lcom/tendcloud/tenddata/TalkingDataGA;->sPlatformType:I

    packed-switch v0, :pswitch_data_0

    const-string v0, "Android_Native_SDK"

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->j:Ljava/lang/String;

    :goto_0
    return-void

    :pswitch_0
    const-string v0, "Android_cocos2d-x_SDK"

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->j:Ljava/lang/String;

    goto :goto_0

    :pswitch_1
    const-string v0, "Android_Unity_SDK"

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->j:Ljava/lang/String;

    goto :goto_0

    :pswitch_2
    const-string v0, "Android_AIR_SDK"

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/l;->j:Ljava/lang/String;

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private a(DD)Z
    .locals 1

    cmpl-double v0, p3, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private a(II)Z
    .locals 1

    if-eq p2, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    if-eqz p2, :cond_0

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private a(ZZ)Z
    .locals 1

    if-eq p2, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 4

    new-instance v0, Lcom/tendcloud/tenddata/game/w;

    invoke-direct {v0}, Lcom/tendcloud/tenddata/game/w;-><init>()V

    const-string v1, "sequenceNumber"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->k:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "partner"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "appPackageName"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "appVersionName"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "appDisplayName"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "isCracked"

    iget-boolean v2, p0, Lcom/tendcloud/tenddata/game/l;->f:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "installationTime"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/l;->e:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "purchaseTime"

    iget v2, p0, Lcom/tendcloud/tenddata/game/l;->g:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "sdkVersion"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "sdkType"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/l;->j:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    sput-object p0, Lcom/tendcloud/tenddata/game/l;->v:Lcom/tendcloud/tenddata/game/l;

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/game/w;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
