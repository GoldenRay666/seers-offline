.class Lcom/tendcloud/appcpa/l;
.super Lcom/tendcloud/appcpa/a;


# instance fields
.field final synthetic b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1}, Lcom/tendcloud/appcpa/a;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/tendcloud/appcpa/k;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->c(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/tendcloud/appcpa/h;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/tendcloud/appcpa/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/tendcloud/appcpa/k;->b(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private b()V
    .locals 6

    const-wide/32 v4, 0x5265c00

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->g()J

    move-result-wide v0

    rem-long v2, v0, v4

    sub-long/2addr v0, v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v0, v2, v0

    cmp-long v2, v0, v4

    if-ltz v2, :cond_1

    const-wide/32 v2, 0xa4cb800

    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    const-string v0, "d2"

    invoke-direct {p0, v0}, Lcom/tendcloud/appcpa/l;->a(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-wide/32 v2, 0x2932e000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    const-wide/32 v2, 0x4d3f6400

    cmp-long v2, v0, v2

    if-gez v2, :cond_2

    const-string v0, "w2"

    invoke-direct {p0, v0}, Lcom/tendcloud/appcpa/l;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-wide/32 v2, -0x6aa79400

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, -0x4bc16c00

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const-string v0, "w5"

    invoke-direct {p0, v0}, Lcom/tendcloud/appcpa/l;->a(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public a()V
    .locals 7

    const-wide/16 v5, 0x0

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->g()J

    move-result-wide v0

    cmp-long v0, v5, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/appcpa/k;->a(J)V

    :cond_0
    invoke-direct {p0}, Lcom/tendcloud/appcpa/l;->b()V

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->a()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->b(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->c(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/tendcloud/appcpa/h;->a(Landroid/content/Context;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/tendcloud/appcpa/k;->c(Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->b()V

    :cond_1
    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->o()J

    move-result-wide v0

    cmp-long v2, v5, v0

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v2}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v2

    iget-object v3, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v3}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v3

    invoke-virtual {v3}, Lcom/tendcloud/appcpa/k;->n()J

    move-result-wide v3

    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/tendcloud/appcpa/k;->a(JJ)V

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0, v5, v6}, Lcom/tendcloud/appcpa/k;->c(J)V

    :cond_2
    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->p()I

    move-result v0

    if-lez v0, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v3}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lcom/tendcloud/appcpa/k;->c(J)V

    iget-object v3, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v3}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v3

    const-wide/16 v4, 0x1f4

    add-long/2addr v1, v4

    invoke-virtual {v3, v1, v2}, Lcom/tendcloud/appcpa/k;->b(J)V

    iget-object v1, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v1}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v1

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Lcom/tendcloud/appcpa/k;->a(I)V

    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->d(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/tendcloud/appcpa/i;

    iget-object v2, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {v1, v2}, Lcom/tendcloud/appcpa/i;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    iget-object v0, p0, Lcom/tendcloud/appcpa/l;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->e(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)V

    return-void
.end method
