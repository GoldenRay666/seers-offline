.class public Le22/c55/s88/e/i;
.super Ljava/lang/Object;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:D

.field public f:D

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ljava/lang/String;

.field public k:I

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:I

.field public q:I

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public u:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const-wide v4, -0x3f80c00000000000L    # -500.0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    iput-object v0, p0, Le22/c55/s88/e/i;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ";"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/e/i;->d:Ljava/lang/String;

    iput-wide v4, p0, Le22/c55/s88/e/i;->e:D

    iput-wide v4, p0, Le22/c55/s88/e/i;->f:D

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->g:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    const v0, 0x186cc

    iput v0, p0, Le22/c55/s88/e/i;->i:I

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    const/16 v0, 0xa0

    iput v0, p0, Le22/c55/s88/e/i;->k:I

    const-string v0, "unknown"

    iput-object v0, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    iput v1, p0, Le22/c55/s88/e/i;->m:I

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    iput v2, p0, Le22/c55/s88/e/i;->p:I

    iput v2, p0, Le22/c55/s88/e/i;->q:I

    const/4 v0, 0x0

    iput-object v0, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->s:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->t:Ljava/lang/String;

    iput v1, p0, Le22/c55/s88/e/i;->u:I

    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/e/i;->g:Ljava/lang/String;

    invoke-static {p1}, Le22/c55/s88/f/a;->g(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    iput v0, p0, Le22/c55/s88/e/i;->p:I

    const-string v0, "unknow"

    iput-object v0, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    invoke-static {p1}, Le22/c55/s88/f/a;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    invoke-static {p1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Le22/c55/s88/e/i;->i:I

    iget v0, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v0, p0, Le22/c55/s88/e/i;->k:I

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    sget-object v1, Le22/c55/s88/f/e;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    sget-object v1, Le22/c55/s88/f/e;->l:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    invoke-static {p1}, Le22/c55/s88/f/a;->k(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Le22/c55/s88/e/i;->u:I

    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private c()I
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Le22/c55/s88/e/i;->d:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->d:Ljava/lang/String;

    :cond_1
    iget-object v0, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, "unknown"

    iput-object v0, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    if-nez v0, :cond_3

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    :cond_3
    iget-object v0, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    if-nez v0, :cond_4

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    :cond_4
    iget-object v0, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    if-nez v0, :cond_5

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    :cond_5
    iget-object v0, p0, Le22/c55/s88/e/i;->s:Ljava/lang/String;

    if-nez v0, :cond_6

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->s:Ljava/lang/String;

    :cond_6
    iget-object v0, p0, Le22/c55/s88/e/i;->t:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, ""

    iput-object v0, p0, Le22/c55/s88/e/i;->t:Ljava/lang/String;

    :cond_7
    iget-object v0, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    if-eqz v0, :cond_8

    const-string v0, ""

    iget-object v2, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    const-string v0, "unknown"

    iput-object v0, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    :cond_9
    iget-object v0, p0, Le22/c55/s88/e/i;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1e

    iget-object v2, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    iget-object v2, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    iget-object v2, p0, Le22/c55/s88/e/i;->d:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    iget-wide v2, p0, Le22/c55/s88/e/i;->e:D

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    iget-wide v2, p0, Le22/c55/s88/e/i;->f:D

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    iget-object v2, p0, Le22/c55/s88/e/i;->g:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    iget-object v2, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x7

    const-string v2, "1.1.0"

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v2, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    if-eqz v0, :cond_b

    const-string v0, ""

    iget-object v3, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x3

    :goto_0
    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x3

    iget-object v2, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x3

    iget-object v2, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x3

    iget-object v2, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x7

    add-int/lit8 v0, v0, 0x7

    iget-object v2, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    if-eqz v2, :cond_a

    const-string v2, ""

    iget-object v3, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    iget-object v1, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, 0x3

    :cond_a
    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x3

    iget-object v1, p0, Le22/c55/s88/e/i;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x3

    iget-object v1, p0, Le22/c55/s88/e/i;->t:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x7

    return v0

    :cond_b
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public a()V
    .locals 0

    return-void
.end method

.method public b()[B
    .locals 8

    const/4 v4, 0x3

    const/4 v3, 0x1

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x0

    invoke-direct {p0}, Le22/c55/s88/e/i;->c()I

    move-result v0

    new-array v1, v0, [B

    const/16 v2, 0x11

    aput-byte v2, v1, v5

    add-int/lit8 v0, v0, -0x3

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-byte v3, v1, v4

    iget-object v0, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    invoke-static {v0, v5, v1, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/4 v0, 0x6

    iget-object v2, p0, Le22/c55/s88/e/i;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, v2

    add-int/lit8 v0, v0, 0x6

    iget-object v2, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    if-eqz v2, :cond_0

    const-string v2, ""

    iget-object v3, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0xa

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    :cond_0
    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0xd

    aput-byte v3, v1, v0

    invoke-static {v7}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget v2, p0, Le22/c55/s88/e/i;->m:I

    invoke-static {v2}, Le22/c55/s88/f/c;->a(I)[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    aput-byte v5, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    invoke-static {v0, v5, v1, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->a:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    aput-byte v6, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    invoke-static {v0, v5, v1, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->c:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    aput-byte v4, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->d:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    invoke-static {v0, v5, v1, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->d:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    aput-byte v7, v1, v0

    iget-wide v3, p0, Le22/c55/s88/e/i;->e:D

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    int-to-short v3, v3

    invoke-static {v3}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v3

    invoke-static {v3, v5, v1, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, v0

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/4 v3, 0x5

    aput-byte v3, v1, v0

    iget-wide v3, p0, Le22/c55/s88/e/i;->f:D

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    int-to-short v3, v3

    invoke-static {v3}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v3

    invoke-static {v3, v5, v1, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v2, v2, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, v0

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/4 v3, 0x6

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->g:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->g:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/4 v3, 0x7

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->h:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x8

    aput-byte v3, v1, v0

    invoke-static {v7}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget v2, p0, Le22/c55/s88/e/i;->i:I

    invoke-static {v2}, Le22/c55/s88/f/c;->a(I)[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x9

    aput-byte v3, v1, v0

    const-string v0, "1.1.0"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    const-string v2, "1.1.0"

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0xb

    aput-byte v3, v1, v0

    invoke-static {v7}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget v2, p0, Le22/c55/s88/e/i;->k:I

    invoke-static {v2}, Le22/c55/s88/f/c;->a(I)[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0xc

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0xe

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0xf

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x10

    aput-byte v3, v1, v0

    invoke-static {v7}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget v2, p0, Le22/c55/s88/e/i;->p:I

    invoke-static {v2}, Le22/c55/s88/f/c;->a(I)[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x11

    aput-byte v3, v1, v0

    invoke-static {v7}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget v2, p0, Le22/c55/s88/e/i;->q:I

    invoke-static {v2}, Le22/c55/s88/f/c;->a(I)[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    iget-object v2, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    if-eqz v2, :cond_1

    const-string v2, ""

    iget-object v3, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x12

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    :cond_1
    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x13

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->s:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->s:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x64

    aput-byte v3, v1, v0

    iget-object v0, p0, Le22/c55/s88/e/i;->t:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-static {v0}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget-object v2, p0, Le22/c55/s88/e/i;->t:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    add-int/lit8 v2, v0, 0x1

    const/16 v3, 0x14

    aput-byte v3, v1, v0

    invoke-static {v7}, Le22/c55/s88/f/c;->a(S)[B

    move-result-object v0

    array-length v3, v0

    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v0, v2, 0x2

    iget v2, p0, Le22/c55/s88/e/i;->u:I

    invoke-static {v2}, Le22/c55/s88/f/c;->a(I)[B

    move-result-object v2

    array-length v3, v2

    invoke-static {v2, v5, v1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v0, v2

    return-object v1
.end method
