.class Lcom/taomee/seer2/n/ab;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/am;

.field final synthetic b:Lcom/taomee/seer2/n/aa;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/aa;Lcom/taomee/seer2/n/am;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    iput-object p2, p0, Lcom/taomee/seer2/n/ab;->a:Lcom/taomee/seer2/n/am;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;Z)Z

    iget-object v0, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v0}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/n/u;->a(Landroid/content/Context;)Lcom/taomee/seer2/n/u;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/taomee/seer2/n/ab;->a:Lcom/taomee/seer2/n/am;

    iget v2, v2, Lcom/taomee/seer2/n/am;->h:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v2}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/taomee/seer2/n/ba;->n(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/taomee/seer2/n/u;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_3

    const-class v0, Lcom/taomee/seer2/n/z;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/taomee/seer2/n/z;

    if-eqz v0, :cond_2

    iget v0, v0, Lcom/taomee/seer2/n/z;->a:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v0}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/taomee/seer2/n/ba;->g(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    :goto_0
    const-class v0, Lcom/taomee/seer2/n/w;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/taomee/seer2/n/w;

    check-cast v0, [Lcom/taomee/seer2/n/w;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v1}, Lcom/taomee/seer2/n/aa;->b(Lcom/taomee/seer2/n/aa;)Lcom/taomee/seer2/n/ad;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v1}, Lcom/taomee/seer2/n/aa;->c(Lcom/taomee/seer2/n/aa;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/taomee/seer2/n/ac;

    invoke-direct {v2, p0, v0}, Lcom/taomee/seer2/n/ac;-><init>(Lcom/taomee/seer2/n/ab;[Lcom/taomee/seer2/n/w;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_1
    const-wide/16 v0, 0xc8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    iget-object v0, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;Z)Z

    return-void

    :cond_2
    iget-object v0, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v0}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/taomee/seer2/n/ba;->g(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v0}, Lcom/taomee/seer2/n/aa;->a(Lcom/taomee/seer2/n/aa;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/taomee/seer2/n/ba;->g(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2
.end method
