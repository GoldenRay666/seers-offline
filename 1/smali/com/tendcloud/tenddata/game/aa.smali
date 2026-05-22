.class public Lcom/tendcloud/tenddata/game/aa;
.super Ljava/lang/Object;


# static fields
.field private static final A:Ljava/lang/String; = "pixel"

.field private static final B:Ljava/lang/String; = "country"

.field private static final C:Ljava/lang/String; = "language"

.field private static final D:Ljava/lang/String; = "timezone"

.field private static final E:Ljava/lang/String; = "osVersion"

.field private static final F:Ljava/lang/String; = "simOperator"

.field private static final G:Ljava/lang/String; = "networkOperator"

.field private static final H:Ljava/lang/String; = "manufacture"

.field private static final I:Ljava/lang/String; = "wap"

.field private static final J:Ljava/lang/String; = "cid"

.field private static final K:Ljava/lang/String; = "networkType"

.field private static final L:Ljava/lang/String; = "carrier"

.field private static final M:Ljava/lang/String; = "apnName"

.field private static final N:Ljava/lang/String; = "apnOperator"

.field private static final O:Ljava/lang/String; = "apnProxy"

.field private static final P:Ljava/lang/String; = "tdudid"

.field private static Q:Lcom/tendcloud/tenddata/game/aa; = null

.field private static final v:Ljava/lang/String; = "deviceId"

.field private static final w:Ljava/lang/String; = "mobileModel"

.field private static final x:Ljava/lang/String; = "osSdkVersion"

.field private static final y:Ljava/lang/String; = "lng"

.field private static final z:Ljava/lang/String; = "lat"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:D

.field public e:D

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:I

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Z

.field public u:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/tendcloud/tenddata/game/aa;->Q:Lcom/tendcloud/tenddata/game/aa;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    const-wide/16 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->b:Ljava/lang/String;

    iput-wide v1, p0, Lcom/tendcloud/tenddata/game/aa;->d:D

    iput-wide v1, p0, Lcom/tendcloud/tenddata/game/aa;->e:D

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->f:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->g:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->h:Ljava/lang/String;

    const/16 v0, 0x8

    iput v0, p0, Lcom/tendcloud/tenddata/game/aa;->i:I

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->j:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->k:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->l:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->m:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->n:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/tendcloud/tenddata/game/aa;->o:I

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->p:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->q:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->r:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->s:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->u:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/TalkingDataGA;->a()Landroid/content/Context;

    move-result-object v2

    const/4 v1, 0x0

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/an;->a(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Location;

    if-nez v1, :cond_1

    :cond_0
    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/location/Location;->getTime()J

    move-result-wide v4

    invoke-virtual {v1}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_0

    move-object v0, v1

    goto :goto_1

    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    iput-wide v3, p0, Lcom/tendcloud/tenddata/game/aa;->e:D

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/tendcloud/tenddata/game/aa;->d:D

    :cond_3
    invoke-static {v2}, Lcom/tendcloud/tenddata/game/c;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->a:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/n;->c()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->b:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/n;->d()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/aa;->c:I

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/n;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->f:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/n;->g()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->g:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/n;->f()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->h:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/n;->b()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/aa;->i:I

    invoke-static {}, Lcom/tendcloud/tenddata/game/n;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->j:Ljava/lang/String;

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/n;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->l:Ljava/lang/String;

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/n;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->k:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/b;->b()Lorg/apache/http/HttpHost;

    move-result-object v1

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->m:Ljava/lang/String;

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/b;->j(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->n:Ljava/lang/String;

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/n;->e(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/aa;->o:I

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/n;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->p:Ljava/lang/String;

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/b;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->q:Ljava/lang/String;

    if-nez v1, :cond_4

    const-string v0, ""

    :goto_2
    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->r:Ljava/lang/String;

    if-nez v1, :cond_5

    const-string v0, ""

    :goto_3
    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->s:Ljava/lang/String;

    invoke-static {}, Lcom/tendcloud/tenddata/game/b;->a()Z

    move-result v0

    iput-boolean v0, p0, Lcom/tendcloud/tenddata/game/aa;->t:Z

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/h;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aa;->u:Ljava/lang/String;

    return-void

    :cond_4
    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_5
    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
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

    const-string v1, "deviceId"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "mobileModel"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "osSdkVersion"

    iget v2, p0, Lcom/tendcloud/tenddata/game/aa;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "pixel"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "country"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->g:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "language"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "timezone"

    iget v2, p0, Lcom/tendcloud/tenddata/game/aa;->i:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "osVersion"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->j:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "networkOperator"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->l:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "simOperator"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->k:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "lat"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/aa;->e:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "lng"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/aa;->d:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "manufacture"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->m:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "wap"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->n:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "cid"

    iget v2, p0, Lcom/tendcloud/tenddata/game/aa;->o:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "carrier"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->p:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "networkType"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->q:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "apnName"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->r:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "apnOperator"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->s:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "apnProxy"

    iget-boolean v2, p0, Lcom/tendcloud/tenddata/game/aa;->t:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    const-string v1, "tdudid"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aa;->u:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/w;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/w;

    sput-object p0, Lcom/tendcloud/tenddata/game/aa;->Q:Lcom/tendcloud/tenddata/game/aa;

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/game/w;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
