.class public abstract Le22/c55/s88/d/e;
.super Ljava/lang/Object;


# instance fields
.field protected a:Landroid/content/Context;

.field private b:Le22/c55/s88/d/h;

.field private c:Ljava/lang/Exception;

.field private d:I

.field private e:Ljava/util/Map;

.field private f:Le22/c55/s88/d/f;

.field private g:F

.field private h:Le22/c55/s88/d/g;

.field private i:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Landroid/content/Context;Le22/c55/s88/d/h;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le22/c55/s88/d/e;->a:Landroid/content/Context;

    iput-object p2, p0, Le22/c55/s88/d/e;->b:Le22/c55/s88/d/h;

    const/4 v0, -0x1

    iput v0, p0, Le22/c55/s88/d/e;->d:I

    const/high16 v0, 0x41f00000    # 30.0f

    iput v0, p0, Le22/c55/s88/d/e;->g:F

    return-void
.end method


# virtual methods
.method protected a(I)V
    .locals 1

    iget v0, p0, Le22/c55/s88/d/e;->d:I

    if-eq p1, v0, :cond_0

    iput p1, p0, Le22/c55/s88/d/e;->d:I

    iget-object v0, p0, Le22/c55/s88/d/e;->f:Le22/c55/s88/d/f;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/d/e;->f:Le22/c55/s88/d/f;

    invoke-interface {v0, p0, p1}, Le22/c55/s88/d/f;->a(Le22/c55/s88/d/e;I)V

    :cond_0
    return-void
.end method

.method public a(Le22/c55/s88/d/f;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/d/e;->f:Le22/c55/s88/d/f;

    return-void
.end method

.method protected a(Ljava/io/InputStream;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/d/e;->i:Ljava/io/InputStream;

    return-void
.end method

.method protected a(Ljava/lang/Exception;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/d/e;->c:Ljava/lang/Exception;

    return-void
.end method

.method protected a(Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/d/e;->e:Ljava/util/Map;

    return-void
.end method

.method public abstract a()Z
.end method

.method public abstract b()V
.end method

.method public c()Z
    .locals 1

    iget v0, p0, Le22/c55/s88/d/e;->d:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch -0x4
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public d()Le22/c55/s88/d/h;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/d/e;->b:Le22/c55/s88/d/h;

    return-object v0
.end method

.method public e()V
    .locals 1

    invoke-virtual {p0}, Le22/c55/s88/d/e;->b()V

    const/4 v0, -0x1

    iput v0, p0, Le22/c55/s88/d/e;->d:I

    return-void
.end method

.method public f()Ljava/io/InputStream;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/d/e;->i:Ljava/io/InputStream;

    return-object v0
.end method

.method public g()Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/d/e;->e:Ljava/util/Map;

    return-object v0
.end method

.method public h()I
    .locals 1

    iget v0, p0, Le22/c55/s88/d/e;->d:I

    return v0
.end method

.method public i()Ljava/lang/Exception;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/d/e;->c:Ljava/lang/Exception;

    return-object v0
.end method

.method public j()F
    .locals 1

    iget v0, p0, Le22/c55/s88/d/e;->g:F

    return v0
.end method

.method public k()Le22/c55/s88/d/g;
    .locals 3

    iget-object v0, p0, Le22/c55/s88/d/e;->h:Le22/c55/s88/d/g;

    if-nez v0, :cond_2

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/d/e;->a:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->bC:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Le22/c55/s88/f/e;->bD:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Le22/c55/s88/f/e;->bC:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Le22/c55/s88/f/e;->bE:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v0, Le22/c55/s88/d/g;

    sget-object v1, Le22/c55/s88/f/e;->bG:Ljava/lang/String;

    const/16 v2, 0x50

    invoke-direct {v0, v1, v2}, Le22/c55/s88/d/g;-><init>(Ljava/lang/String;I)V

    :goto_0
    return-object v0

    :cond_1
    sget-object v1, Le22/c55/s88/f/e;->bF:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Le22/c55/s88/d/g;

    sget-object v1, Le22/c55/s88/f/e;->bH:Ljava/lang/String;

    const/16 v2, 0x50

    invoke-direct {v0, v1, v2}, Le22/c55/s88/d/g;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_2
    iget-object v0, p0, Le22/c55/s88/d/e;->h:Le22/c55/s88/d/g;

    goto :goto_0
.end method

.method public l()Z
    .locals 3

    const/4 v1, 0x1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/d/e;->a:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    move v0, v1

    goto :goto_0
.end method
